-- ============================================================================
-- TaskHub Supabase Database Setup Script
-- ============================================================================
-- This script sets up the complete database schema for TaskHub.
-- Run this in your Supabase SQL Editor (https://supabase.com/dashboard/project/_/sql)

-- ============================================================================
-- SECTION 1: CUSTOM TYPES (ENUMS)
-- ============================================================================

-- Task status enum
CREATE TYPE task_status AS ENUM ('todo', 'in_progress', 'completed', 'cancelled');

-- Task priority enum
CREATE TYPE task_priority AS ENUM ('low', 'medium', 'high', 'urgent');

-- Project role enum
CREATE TYPE project_role AS ENUM ('admin', 'editor', 'viewer');

-- Notification type enum
CREATE TYPE notification_type AS ENUM (
  'project_invite',
  'task_assigned',
  'task_due_soon',
  'task_completed',
  'project_updated',
  'member_joined',
  'reminder'
);

-- ============================================================================
-- SECTION 2: TABLES
-- ============================================================================

-- Profiles table (extends Supabase auth.users)
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  display_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Projects table
CREATE TABLE public.projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL CHECK (char_length(title) >= 1 AND char_length(title) <= 200),
  description TEXT,
  due_date TIMESTAMPTZ,
  color_code TEXT NOT NULL DEFAULT '#6366F1' CHECK (color_code ~* '^#[0-9A-F]{6}$'),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Project members table (junction table for project collaboration)
CREATE TABLE public.project_members (
  project_id UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  role project_role NOT NULL DEFAULT 'viewer',
  joined_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (project_id, user_id)
);

-- Tasks table
CREATE TABLE public.tasks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID REFERENCES public.projects(id) ON DELETE CASCADE,
  created_by UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  assigned_to UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  title TEXT NOT NULL CHECK (char_length(title) >= 1 AND char_length(title) <= 500),
  description TEXT,
  status task_status NOT NULL DEFAULT 'todo',
  priority task_priority NOT NULL DEFAULT 'medium',
  due_date TIMESTAMPTZ,
  is_recurring BOOLEAN NOT NULL DEFAULT false,
  recurrence_rule TEXT,
  parent_task_id UUID REFERENCES public.tasks(id) ON DELETE CASCADE,
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Notifications table
CREATE TABLE public.notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  type notification_type NOT NULL,
  title TEXT NOT NULL CHECK (char_length(title) >= 1 AND char_length(title) <= 200),
  body TEXT,
  related_entity_type TEXT,
  related_entity_id UUID,
  is_read BOOLEAN NOT NULL DEFAULT false,
  read_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ============================================================================
-- SECTION 3: INDEXES
-- ============================================================================

CREATE INDEX idx_projects_owner ON public.projects(owner_id);
CREATE INDEX idx_project_members_user ON public.project_members(user_id);
CREATE INDEX idx_project_members_project ON public.project_members(project_id);
CREATE INDEX idx_tasks_project ON public.tasks(project_id);
CREATE INDEX idx_tasks_created_by ON public.tasks(created_by);
CREATE INDEX idx_tasks_assigned_to ON public.tasks(assigned_to);
CREATE INDEX idx_tasks_status ON public.tasks(status);
CREATE INDEX idx_tasks_due_date ON public.tasks(due_date);
CREATE INDEX idx_notifications_user ON public.notifications(user_id);
CREATE INDEX idx_notifications_unread ON public.notifications(user_id) WHERE is_read = false;

-- ============================================================================
-- SECTION 4: HELPER FUNCTIONS
-- ============================================================================

-- Function to check if user is a project member
CREATE OR REPLACE FUNCTION public.is_project_member(p_project_id UUID, p_user_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.project_members
    WHERE project_id = p_project_id AND user_id = p_user_id
  );
END;
$$;

-- Function to check if user is a project admin (owner or admin role)
CREATE OR REPLACE FUNCTION public.is_project_admin(p_project_id UUID, p_user_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.projects WHERE id = p_project_id AND owner_id = p_user_id
  ) OR EXISTS (
    SELECT 1 FROM public.project_members
    WHERE project_id = p_project_id AND user_id = p_user_id AND role = 'admin'
  );
END;
$$;

-- Function to check if user can edit a project (owner, admin, or editor)
CREATE OR REPLACE FUNCTION public.can_edit_project(p_project_id UUID, p_user_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.projects WHERE id = p_project_id AND owner_id = p_user_id
  ) OR EXISTS (
    SELECT 1 FROM public.project_members
    WHERE project_id = p_project_id AND user_id = p_user_id AND role IN ('admin', 'editor')
  );
END;
$$;

-- Function to create notifications
CREATE OR REPLACE FUNCTION public.create_notification(
  p_user_id UUID,
  p_type notification_type,
  p_title TEXT,
  p_body TEXT DEFAULT NULL,
  p_related_entity_type TEXT DEFAULT NULL,
  p_related_entity_id UUID DEFAULT NULL
)
RETURNS UUID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
DECLARE
  notification_id UUID;
BEGIN
  INSERT INTO public.notifications (user_id, type, title, body, related_entity_type, related_entity_id)
  VALUES (p_user_id, p_type, p_title, p_body, p_related_entity_type, p_related_entity_id)
  RETURNING id INTO notification_id;

  RETURN notification_id;
END;
$$;

-- ============================================================================
-- SECTION 5: TRIGGER FUNCTIONS
-- ============================================================================

-- Auto-update updated_at timestamp
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
SET search_path TO 'public'
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Handle new user creation (create profile from auth.users)
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public', 'auth'
AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.raw_user_meta_data->>'name'),
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$;

-- Auto-add project owner as admin member
CREATE OR REPLACE FUNCTION public.add_owner_as_member()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  INSERT INTO public.project_members (project_id, user_id, role)
  VALUES (NEW.id, NEW.owner_id, 'admin');
  RETURN NEW;
END;
$$;

-- Handle task completion timestamp
CREATE OR REPLACE FUNCTION public.handle_task_completed()
RETURNS TRIGGER
LANGUAGE plpgsql
SET search_path TO 'public'
AS $$
BEGIN
  IF NEW.status = 'completed' AND OLD.status != 'completed' THEN
    NEW.completed_at = now();
  ELSIF NEW.status != 'completed' AND OLD.status = 'completed' THEN
    NEW.completed_at = NULL;
  END IF;
  RETURN NEW;
END;
$$;

-- Handle notification read timestamp
CREATE OR REPLACE FUNCTION public.handle_notification_read()
RETURNS TRIGGER
LANGUAGE plpgsql
SET search_path TO 'public'
AS $$
BEGIN
  IF NEW.is_read = true AND OLD.is_read = false THEN
    NEW.read_at = now();
  ELSIF NEW.is_read = false AND OLD.is_read = true THEN
    NEW.read_at = NULL;
  END IF;
  RETURN NEW;
END;
$$;

-- Notify when task is assigned
CREATE OR REPLACE FUNCTION public.notify_task_assignment()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
DECLARE
  task_title TEXT;
  project_title TEXT;
  assigner_name TEXT;
BEGIN
  -- Only trigger when assigned_to is set or changed
  IF NEW.assigned_to IS NOT NULL AND
     (OLD.assigned_to IS NULL OR OLD.assigned_to != NEW.assigned_to) AND
     NEW.assigned_to != NEW.created_by THEN

    -- Get task and project info
    SELECT t.title, p.title INTO task_title, project_title
    FROM public.tasks t
    JOIN public.projects p ON t.project_id = p.id
    WHERE t.id = NEW.id;

    -- Get assigner name (the person who made the change or creator)
    SELECT COALESCE(display_name, email) INTO assigner_name
    FROM public.profiles
    WHERE id = COALESCE(auth.uid(), NEW.created_by);

    -- Create notification for the assignee
    PERFORM public.create_notification(
      NEW.assigned_to,
      'task_assigned',
      'New task assigned: ' || NEW.title,
      'You have been assigned to "' || NEW.title || '" in project "' || project_title || '" by ' || COALESCE(assigner_name, 'a team member'),
      'task',
      NEW.id
    );
  END IF;

  RETURN NEW;
END;
$$;

-- Notify when task is completed
CREATE OR REPLACE FUNCTION public.notify_task_completed()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
DECLARE
  project_title TEXT;
  completer_name TEXT;
BEGIN
  -- Only trigger when status changes to completed
  IF NEW.status = 'completed' AND OLD.status != 'completed' THEN
    -- Get project title
    SELECT title INTO project_title
    FROM public.projects
    WHERE id = NEW.project_id;

    -- Get completer name
    SELECT COALESCE(display_name, email) INTO completer_name
    FROM public.profiles
    WHERE id = auth.uid();

    -- Notify assigned user if different from completer
    IF NEW.assigned_to IS NOT NULL AND NEW.assigned_to != auth.uid() THEN
      PERFORM public.create_notification(
        NEW.assigned_to,
        'task_completed',
        'Task completed: ' || NEW.title,
        '"' || NEW.title || '" has been marked as completed by ' || COALESCE(completer_name, 'a team member'),
        'task',
        NEW.id
      );
    END IF;

    -- Notify task creator if different from completer and assignee
    IF NEW.created_by != auth.uid() AND NEW.created_by != NEW.assigned_to THEN
      PERFORM public.create_notification(
        NEW.created_by,
        'task_completed',
        'Task completed: ' || NEW.title,
        '"' || NEW.title || '" has been marked as completed by ' || COALESCE(completer_name, 'a team member'),
        'task',
        NEW.id
      );
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

-- Notify when a member joins a project
CREATE OR REPLACE FUNCTION public.notify_member_joined()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
DECLARE
  project_owner_id UUID;
  project_title TEXT;
  member_name TEXT;
BEGIN
  -- Get project info
  SELECT owner_id, title INTO project_owner_id, project_title
  FROM public.projects
  WHERE id = NEW.project_id;

  -- Get member name
  SELECT COALESCE(display_name, email) INTO member_name
  FROM public.profiles
  WHERE id = NEW.user_id;

  -- Don't notify if the owner added themselves or is adding a member
  IF project_owner_id != NEW.user_id THEN
    PERFORM public.create_notification(
      project_owner_id,
      'member_joined',
      'New member joined: ' || project_title,
      member_name || ' has joined your project "' || project_title || '" as ' || NEW.role,
      'project',
      NEW.project_id
    );
  END IF;

  RETURN NEW;
END;
$$;

-- ============================================================================
-- SECTION 6: TRIGGERS
-- ============================================================================

-- Trigger to create profile when user signs up
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_new_user();

-- Triggers for updated_at timestamps
CREATE TRIGGER set_profiles_updated_at
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER set_projects_updated_at
  BEFORE UPDATE ON public.projects
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER set_tasks_updated_at
  BEFORE UPDATE ON public.tasks
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_updated_at();

-- Trigger to add owner as admin member when project is created
CREATE TRIGGER on_project_created_add_owner
  AFTER INSERT ON public.projects
  FOR EACH ROW
  EXECUTE FUNCTION public.add_owner_as_member();

-- Trigger to handle task completion timestamp
CREATE TRIGGER set_task_completed_at
  BEFORE UPDATE ON public.tasks
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_task_completed();

-- Trigger to handle notification read timestamp
CREATE TRIGGER set_notification_read_at
  BEFORE UPDATE ON public.notifications
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_notification_read();

-- Notification triggers
CREATE TRIGGER on_task_assigned
  AFTER INSERT OR UPDATE ON public.tasks
  FOR EACH ROW
  EXECUTE FUNCTION public.notify_task_assignment();

CREATE TRIGGER on_task_completed
  AFTER UPDATE ON public.tasks
  FOR EACH ROW
  EXECUTE FUNCTION public.notify_task_completed();

CREATE TRIGGER on_member_joined
  AFTER INSERT ON public.project_members
  FOR EACH ROW
  EXECUTE FUNCTION public.notify_member_joined();

-- ============================================================================
-- SECTION 7: ROW LEVEL SECURITY (RLS)
-- ============================================================================

-- Enable RLS on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.project_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tasks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

-- PROFILES POLICIES
CREATE POLICY "Profiles are viewable by authenticated users"
  ON public.profiles FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can update own profile"
  ON public.profiles FOR UPDATE
  TO authenticated
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- PROJECTS POLICIES
CREATE POLICY "Users can view projects they own or are members of"
  ON public.projects FOR SELECT
  TO authenticated
  USING (owner_id = auth.uid() OR is_project_member(id, auth.uid()));

CREATE POLICY "Authenticated users can create projects"
  ON public.projects FOR INSERT
  TO authenticated
  WITH CHECK (owner_id = auth.uid());

CREATE POLICY "Project owners and admins can update projects"
  ON public.projects FOR UPDATE
  TO authenticated
  USING (is_project_admin(id, auth.uid()))
  WITH CHECK (is_project_admin(id, auth.uid()));

CREATE POLICY "Only project owners can delete projects"
  ON public.projects FOR DELETE
  TO authenticated
  USING (owner_id = auth.uid());

-- PROJECT MEMBERS POLICIES
CREATE POLICY "Project members are viewable by project participants"
  ON public.project_members FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM projects
      WHERE projects.id = project_members.project_id AND projects.owner_id = auth.uid()
    ) OR is_project_member(project_id, auth.uid())
  );

CREATE POLICY "Project admins can add members"
  ON public.project_members FOR INSERT
  TO authenticated
  WITH CHECK (is_project_admin(project_id, auth.uid()));

CREATE POLICY "Project admins can update member roles"
  ON public.project_members FOR UPDATE
  TO authenticated
  USING (is_project_admin(project_id, auth.uid()) AND user_id <> auth.uid())
  WITH CHECK (is_project_admin(project_id, auth.uid()));

CREATE POLICY "Project admins can remove members or users can leave"
  ON public.project_members FOR DELETE
  TO authenticated
  USING (user_id = auth.uid() OR is_project_admin(project_id, auth.uid()));

-- TASKS POLICIES
CREATE POLICY "Users can view tasks"
  ON public.tasks FOR SELECT
  TO authenticated
  USING (
    created_by = auth.uid()
    OR assigned_to = auth.uid()
    OR (project_id IS NOT NULL AND EXISTS (
      SELECT 1 FROM project_members pm
      WHERE pm.project_id = tasks.project_id AND pm.user_id = auth.uid()
    ))
  );

CREATE POLICY "Tasks are viewable by project participants"
  ON public.tasks FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM projects
      WHERE projects.id = tasks.project_id AND projects.owner_id = auth.uid()
    ) OR is_project_member(project_id, auth.uid())
  );

CREATE POLICY "Users can create tasks"
  ON public.tasks FOR INSERT
  TO authenticated
  WITH CHECK (
    created_by = auth.uid() AND (
      project_id IS NULL OR EXISTS (
        SELECT 1 FROM project_members pm
        WHERE pm.project_id = tasks.project_id
        AND pm.user_id = auth.uid()
        AND pm.role IN ('admin', 'editor')
      )
    )
  );

CREATE POLICY "Project editors can create tasks"
  ON public.tasks FOR INSERT
  TO authenticated
  WITH CHECK (can_edit_project(project_id, auth.uid()) AND created_by = auth.uid());

CREATE POLICY "Users can update tasks"
  ON public.tasks FOR UPDATE
  TO authenticated
  USING (
    created_by = auth.uid()
    OR assigned_to = auth.uid()
    OR (project_id IS NOT NULL AND EXISTS (
      SELECT 1 FROM project_members pm
      WHERE pm.project_id = tasks.project_id
      AND pm.user_id = auth.uid()
      AND pm.role IN ('admin', 'editor')
    ))
  );

CREATE POLICY "Project editors and assignees can update tasks"
  ON public.tasks FOR UPDATE
  TO authenticated
  USING (can_edit_project(project_id, auth.uid()) OR assigned_to = auth.uid())
  WITH CHECK (can_edit_project(project_id, auth.uid()) OR assigned_to = auth.uid());

CREATE POLICY "Users can delete tasks"
  ON public.tasks FOR DELETE
  TO authenticated
  USING (
    created_by = auth.uid()
    OR (project_id IS NOT NULL AND EXISTS (
      SELECT 1 FROM project_members pm
      WHERE pm.project_id = tasks.project_id
      AND pm.user_id = auth.uid()
      AND pm.role = 'admin'
    ))
  );

CREATE POLICY "Project admins and task creators can delete tasks"
  ON public.tasks FOR DELETE
  TO authenticated
  USING (is_project_admin(project_id, auth.uid()) OR created_by = auth.uid());

-- NOTIFICATIONS POLICIES
CREATE POLICY "Users can view own notifications"
  ON public.notifications FOR SELECT
  TO authenticated
  USING (user_id = auth.uid());

CREATE POLICY "Users can update own notifications"
  ON public.notifications FOR UPDATE
  TO authenticated
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "Users can delete own notifications"
  ON public.notifications FOR DELETE
  TO authenticated
  USING (user_id = auth.uid());

-- ============================================================================
-- SECTION 8: ENABLE REALTIME
-- ============================================================================

-- Enable realtime for all tables
ALTER PUBLICATION supabase_realtime ADD TABLE public.profiles;
ALTER PUBLICATION supabase_realtime ADD TABLE public.projects;
ALTER PUBLICATION supabase_realtime ADD TABLE public.project_members;
ALTER PUBLICATION supabase_realtime ADD TABLE public.tasks;
ALTER PUBLICATION supabase_realtime ADD TABLE public.notifications;

-- ============================================================================
-- SETUP COMPLETE!
-- ============================================================================
--=========================================================================
