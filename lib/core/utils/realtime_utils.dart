import 'dart:async';
import 'dart:developer' as developer;

import 'package:rxdart/rxdart.dart';

/// Utility class for handling Realtime streams with retry logic and error logging.
class RealtimeUtils {
  /// Wraps a stream factory with retry logic and error logging.
  ///
  /// [streamFactory] is a function that returns the stream to be subscribed to.
  /// [logName] is the name used for logging errors.
  /// [maxRetries] is the maximum number of retries before giving up (default 5).
  /// [initialDelay] is the initial delay before the first retry (default 1s).
  static Stream<T> safeStream<T>(
    Stream<T> Function() streamFactory, {
    required String logName,
    int maxRetries = 5,
    Duration initialDelay = const Duration(seconds: 1),
  }) {
    int retryCount = 0;

    return RetryWhenStream<T>(
      () => streamFactory().handleError((error, stackTrace) {
        developer.log(
          'Error in $logName stream: $error',
          name: logName,
          error: error,
          stackTrace: stackTrace,
        );
        throw error;
      }),
      (error, stackTrace) {
        if (retryCount >= maxRetries) {
          developer.log(
            'Max retries reached for $logName. Stream will terminate with error.',
            name: logName,
          );
          return Stream.error(error, stackTrace);
        }

        retryCount++;
        final delay = initialDelay * (1 << (retryCount - 1)); // Exponential backoff
        
        developer.log(
          'Retrying $logName stream in ${delay.inSeconds}s (Attempt $retryCount/$maxRetries)',
          name: logName,
        );
        
        return TimerStream(null, delay);
      },
    );
  }
}
