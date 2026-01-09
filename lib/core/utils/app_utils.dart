import 'package:flutter/material.dart';

/// Utility class containing shared helper functions used across the app
class AppUtils {
  AppUtils._();

  /// Formats a DateTime to a human-readable date string
  ///
  /// Examples:
  /// - "January 7, 2026"
  /// - "March 3, 2026"
  static String formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Formats a DateTime to a short date string
  ///
  /// Examples:
  /// - "Jan 7, 2026"
  /// - "Mar 3, 2026"
  static String formatShortDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Formats a DateTime to show relative due date
  ///
  /// Examples:
  /// - "Overdue" (past date)
  /// - "Due today"
  /// - "Due tomorrow"
  /// - "Due in 3 days"
  /// - "21/3/2026" (more than a week away)
  static String formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
    final difference = due.difference(today).inDays;

    if (difference < 0) {
      return 'Overdue';
    } else if (difference == 0) {
      return 'Due today';
    } else if (difference == 1) {
      return 'Due tomorrow';
    } else if (difference < 7) {
      return 'Due in $difference days';
    } else {
      return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
    }
  }

  /// Formats a relative short due date
  ///
  /// Examples:
  /// - "Overdue"
  /// - "Today"
  /// - "Tomorrow"
  /// - "15/3"
  static String formatShortDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
    final difference = due.difference(today).inDays;

    if (difference < 0) {
      return 'Overdue';
    } else if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else {
      return '${dueDate.day}/${dueDate.month}';
    }
  }

  /// Gets the color for a due date based on urgency
  ///
  /// Returns:
  /// - Red for overdue tasks
  /// - Orange for today
  /// - Grey for future tasks
  static Color getDueDateColor(DateTime dueDate, {bool isCompleted = false}) {
    if (isCompleted) return Colors.grey;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    if (due.isBefore(today)) {
      return Colors.red;
    } else if (due == today) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  /// Parses a color code string to a Color object
  ///
  /// Accepts formats like:
  /// - "#FF5733"
  /// - "#FFC107"
  ///
  /// Returns the parsed color or a fallback color if parsing fails
  static Color parseColor(String colorCode, {Color fallback = Colors.indigo}) {
    try {
      return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
    } catch (_) {
      return fallback;
    }
  }

  /// Normalizes a DateTime to midnight (00:00:00)
  ///
  /// This is useful for comparing dates without time components
  static DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Checks if two dates are the same day
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Validates an email address
  ///
  /// Returns true if the email is valid, false otherwise
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Capitalizes the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Gets month name from month number (1-12)
  static String getMonthName(int month, {bool short = false}) {
    const fullMonths = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    const shortMonths = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    if (month < 1 || month > 12) return '';
    return short ? shortMonths[month - 1] : fullMonths[month - 1];
  }

  /// Gets weekday name from DateTime
  static String getWeekdayName(DateTime date, {bool short = false}) {
    const fullWeekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    const shortWeekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final weekday = date.weekday - 1;
    return short ? shortWeekdays[weekday] : fullWeekdays[weekday];
  }
}
