import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../projects/domain/entities/project.dart';
import '../../../projects/presentation/bloc/project_bloc.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';

class CreateTaskDialog extends StatefulWidget {
  final String? projectId;

  const CreateTaskDialog({super.key, this.projectId});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedProjectId;
  TaskPriority _priority = TaskPriority.medium;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    _selectedProjectId = widget.projectId;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.whenOrNull(
          taskCreated: (task) {
            Navigator.pop(context);
            showFToast(
              context: context,
              icon: const Icon(FIcons.check),
              title: Text('Task "${task.title}" created!'),
              duration: const Duration(seconds: 3),
            );
            context.read<TaskBloc>().add(const TaskEvent.loadMyTasks());
          },
          error: (failure) {
            showFToast(
              context: context,
              icon: const Icon(FIcons.triangleAlert),
              title: const Text('Error creating task'),
              duration: const Duration(seconds: 4),
            );
          },
        );
      },
      child: Dialog(
        backgroundColor: colors.backgroundCard,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const .all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Create Task',
                      style: context.theme.typography.xl.copyWith(
                        fontWeight: .bold,
                        color: colors.textPrimary,
                      ),
                    ),
                    FTappable(
                      onPress: () => Navigator.pop(context),
                      child: Icon(
                        FIcons.x,
                        color: colors.textSecondary,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Task Title',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                FTextField(
                  control: FTextFieldControl.managed(
                    controller: _titleController,
                  ),
                  hint: 'What needs to be done?',
                ),
                const SizedBox(height: 20),
                Text(
                  'Project (optional)',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<ProjectBloc, ProjectState>(
                  builder: (context, state) {
                    final projects = state.maybeWhen(
                      projectsLoaded: (projects) => projects,
                      projectLoaded: (project) => [
                        ProjectWithRole(
                          project: project,
                          role: ProjectRole.viewer, // Dummy role for display
                          taskCount: 0,
                          completedTaskCount: 0,
                        ),
                      ],
                      orElse: () => <ProjectWithRole>[],
                    );

                    // Ensure selected project is in the list, otherwise nullify for dropdown
                    // to prevent assertion error.
                    // If we have a projectId but it's not in the list, we treat it as null in the dropdown
                    // but keep the internal state if needed (or just reset).
                    final effectiveProjectId =
                        projects.any((p) => p.project.id == _selectedProjectId)
                        ? _selectedProjectId
                        : null;

                    // If effectiveProjectId is null but _selectedProjectId was not,
                    // it means we haven't loaded the target project yet.
                    // We might want to just show 'Loading...' or keep it null.

                    return Container(
                      padding: const .symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: colors.backgroundSecondary,
                        borderRadius: .circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String?>(
                          value: effectiveProjectId,
                          isExpanded: true,
                          dropdownColor: colors.backgroundCard,
                          style: context.theme.typography.sm.copyWith(
                            color: colors.textPrimary,
                          ),
                          hint: Text(
                            'Personal Task',
                            style: context.theme.typography.sm.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                          items: [
                            DropdownMenuItem<String?>(
                              value: null,
                              child: Text(
                                'Personal Task (No Project)',
                                style: context.theme.typography.sm.copyWith(
                                  color: colors.textPrimary,
                                ),
                              ),
                            ),
                            ...projects.map(
                              (p) => DropdownMenuItem<String?>(
                                value: p.project.id,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: _parseColor(p.project.colorCode),
                                        shape: .circle,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      p.project.title,
                                      style: context.theme.typography.sm
                                          .copyWith(color: colors.textPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) =>
                              setState(() => _selectedProjectId = value),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Description (optional)',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                FTextField(
                  control: FTextFieldControl.managed(
                    controller: _descriptionController,
                  ),
                  hint: 'Add details',
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                Text(
                  'Priority',
                  style: context.theme.typography.sm.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: TaskPriority.values.map((priority) {
                    final isSelected = priority == _priority;
                    return Expanded(
                      child: Padding(
                        padding: const .only(right: 8),
                        child: FTappable(
                          onPress: () => setState(() => _priority = priority),
                          child: Container(
                            padding: const .symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppTheme.primaryYellow
                                  : colors.backgroundSecondary,
                              borderRadius: .circular(8),
                            ),
                            child: Center(
                              child: Text(
                                priority.name.substring(0, 1).toUpperCase() +
                                    priority.name.substring(1),
                                style: context.theme.typography.xs.copyWith(
                                  color: isSelected
                                      ? AppTheme.backgroundDark
                                      : colors.textSecondary,
                                  fontWeight: isSelected ? .bold : .normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                FTappable(
                  onPress: _selectDueDate,
                  child: Container(
                    padding: const .all(16),
                    decoration: BoxDecoration(
                      color: colors.backgroundSecondary,
                      borderRadius: .circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FIcons.calendar,
                          color: colors.textSecondary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _dueDate == null
                                ? 'Add due date'
                                : '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}',
                            style: context.theme.typography.sm.copyWith(
                              color: _dueDate == null
                                  ? colors.textSecondary
                                  : colors.textPrimary,
                            ),
                          ),
                        ),
                        if (_dueDate != null)
                          FTappable(
                            onPress: () => setState(() => _dueDate = null),
                            child: Icon(
                              FIcons.x,
                              color: colors.textSecondary,
                              size: 18,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: FButton(
                        onPress: () => Navigator.pop(context),
                        style: FButtonStyle.outline(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );
                          return FButton(
                            onPress: isLoading ? null : _submit,
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppTheme.backgroundDark,
                                    ),
                                  )
                                : const Text('Create'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (date != null) {
      setState(() => _dueDate = date);
    }
  }

  void _submit() {
    if (_titleController.text.trim().isEmpty) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Please enter a task title'),
        duration: const Duration(seconds: 4),
      );
      return;
    }

    context.read<TaskBloc>().add(
      TaskEvent.createTask(
        projectId: _selectedProjectId,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        priority: _priority,
        dueDate: _dueDate,
      ),
    );
  }

  Color _parseColor(String colorCode) {
    try {
      return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppTheme.primaryYellow;
    }
  }
}
