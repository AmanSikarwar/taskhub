import '../../features/auth/domain/entities/auth_failure.dart';
import '../../features/calendar/domain/entities/calendar_failure.dart';
import '../../features/notifications/domain/entities/notification_failure.dart';
import '../../features/projects/domain/entities/project_failure.dart';
import '../../features/tasks/domain/entities/task_failure.dart';

/// Centralized error message mapping for all failure types.
///
/// Use these methods to convert domain failures into user-friendly messages.
class ErrorMessages {
  ErrorMessages._();

  /// Converts an [AuthFailure] to a user-friendly error message.
  static String fromAuthFailure(AuthFailure failure) {
    return failure.map(
      serverError: (e) => e.message,
      emailAlreadyInUse: (_) => 'This email is already registered',
      invalidEmailAndPasswordCombination: (_) => 'Invalid email or password',
      weakPassword: (_) => 'Password is too weak',
      userNotFound: (_) => 'No user found with this email',
      emailNotVerified: (_) => 'Please verify your email first',
      tooManyRequests: (_) => 'Too many attempts. Please try again later',
      networkError: (_) => 'Network error. Please check your connection',
      cancelledByUser: (_) => 'Sign in was cancelled',
      unknown: (e) => e.message,
    );
  }

  /// Converts a [ProjectFailure] to a user-friendly error message.
  static String fromProjectFailure(ProjectFailure failure) {
    return failure.map(
      serverError: (e) => e.message,
      networkError: (_) => 'Network error. Please check your connection',
      notFound: (_) => 'Project not found',
      unauthorized: (_) => 'You are not authorized to access this project',
      forbidden: (_) => 'Access denied',
      invalidTitle: (_) => 'Please enter a valid project title',
      invalidColorCode: (_) => 'Invalid color code',
      memberAlreadyExists: (_) => 'This member is already in the project',
      memberNotFound: (_) => 'Member not found',
      cannotRemoveOwner: (_) => 'Cannot remove the project owner',
      unknown: (e) => e.message,
    );
  }

  /// Converts a [TaskFailure] to a user-friendly error message.
  static String fromTaskFailure(TaskFailure failure) {
    return failure.map(
      serverError: (e) => e.message,
      networkError: (_) => 'Network error. Please check your connection',
      notFound: (_) => 'Task not found',
      unauthorized: (_) => 'You are not authorized to access this task',
      forbidden: (_) => 'Access denied',
      invalidTitle: (_) => 'Please enter a valid task title',
      invalidRecurrenceRule: (_) => 'Invalid recurrence rule',
      projectNotFound: (_) => 'The project for this task was not found',
      assigneeNotFound: (_) => 'The assigned user was not found',
      unknown: (e) => e.message,
    );
  }

  /// Converts a [CalendarFailure] to a user-friendly error message.
  static String fromCalendarFailure(CalendarFailure failure) {
    return failure.map(
      serverError: (e) => e.message,
      networkError: (_) => 'Network error. Please check your connection',
      unauthorized: (_) => 'You are not authorized to access the calendar',
      unknown: (e) => e.message,
    );
  }

  /// Converts a [NotificationFailure] to a user-friendly error message.
  static String fromNotificationFailure(NotificationFailure failure) {
    return failure.map(
      serverError: (e) => e.message,
      networkError: (_) => 'Network error. Please check your connection',
      notFound: (_) => 'Notification not found',
      unauthorized: (_) => 'You are not authorized to view notifications',
      unknown: (e) => e.message,
    );
  }
}
