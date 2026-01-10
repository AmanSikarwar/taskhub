# Supabase Setup Guide for TaskHub

This guide will help you set up your own Supabase backend for TaskHub.

## Prerequisites

- A [Supabase](https://supabase.com) account (free tier works)
- Flutter SDK installed
- The TaskHub Flutter project cloned

## Step 1: Create a Supabase Project

1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
2. Click **New Project**
3. Enter a project name (e.g., "TaskHub")
4. Set a secure database password (save this!)
5. Select your preferred region
6. Click **Create new project** and wait for it to initialize

## Step 2: Run the Database Setup Script

1. In your Supabase dashboard, go to **SQL Editor** (left sidebar)
2. Click **New query**
3. Open the file `supabase/setup.sql` from this repository
4. Copy the entire contents and paste it into the SQL Editor
5. Click **Run** (or press Cmd/Ctrl + Enter)
6. You should see "Success. No rows returned" - this is expected

The script creates:

- 5 tables: `profiles`, `projects`, `project_members`, `tasks`, `notifications`
- 4 custom enums: `task_status`, `task_priority`, `project_role`, `notification_type`
- 12 helper functions and triggers for automation
- Row Level Security (RLS) policies for all tables
- Realtime enabled for all tables

## Step 3: Configure Authentication (Optional)

### Email/Password Auth (Enabled by default)

No additional setup needed.

### Google OAuth

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project or select an existing one
3. Go to **APIs & Services** > **Credentials**
4. Click **Create Credentials** > **OAuth client ID**
5. For Web application:

   - Add `https://YOUR_PROJECT_ID.supabase.co/auth/v1/callback` to Authorized redirect URIs
6. For iOS:

   - Select "iOS" as application type
   - Enter your bundle ID
7. Copy the Client IDs
8. In Supabase dashboard:

   - Go to **Authentication** > **Providers**
   - Enable **Google**
   - Paste your Client ID and Client Secret
   - Save

## Step 4: Get Your API Keys

1. In Supabase dashboard, go to **Project Settings** > **API**
2. Copy:
   - **Project URL** (e.g., `https://xxxx.supabase.co`)
   - **anon public** key (under Project API keys)

## Step 5: Configure the Flutter App

1. Create a `.env` file in the project root:

```env
SUPABASE_URL=https://YOUR_PROJECT_ID.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
GOOGLE_WEB_CLIENT_ID=your-google-web-client-id
GOOGLE_IOS_CLIENT_ID=your-google-ios-client-id
```

1. Generate the environment config:

```bash
dart run build_runner build
```

1. Run the app:

```bash
flutter run
```

## Step 6: Configure Deep Links (for OAuth callbacks)

### iOS (ios/Runner/Info.plist)

The app is configured to handle `io.taskhub://auth-callback`. Ensure this matches your Supabase redirect URL settings.

### Android (android/app/src/main/AndroidManifest.xml)

Add the following inside the `<activity>` tag:

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="io.taskhub" android:host="auth-callback" />
</intent-filter>
```

## Troubleshooting

### "Permission denied" errors

- Check that RLS policies are correctly applied
- Ensure the user is authenticated
- Verify the anon key is correct

### Realtime not working

- Verify the tables are added to the `supabase_realtime` publication
- Run this in SQL Editor to check:

  ```sql
  SELECT * FROM pg_publication_tables WHERE pubname = 'supabase_realtime';
  ```

- All 5 tables should be listed

### Google OAuth not redirecting

- Verify redirect URIs in Google Cloud Console match Supabase
- Check that deep link configuration is correct in your app

## Database Schema Overview

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────┐
│  profiles   │────<│ project_members  │>────│  projects   │
│  (users)    │     │  (junction)      │     │             │
└─────────────┘     └──────────────────┘     └──────┬──────┘
       │                                            │
       │                                            │
       │            ┌─────────────────┐             │
       └───────────>│     tasks       │<────────────┘
                    │                 │
                    └─────────────────┘
                            │
       ┌────────────────────┘
       │
       v
┌─────────────────┐
│  notifications  │
└─────────────────┘
```

## Support

If you encounter issues:

1. Check the Supabase logs in your dashboard under **Database** > **Logs**
2. Verify your `.env` configuration
3. Ensure all dependencies are installed with `flutter pub get`
