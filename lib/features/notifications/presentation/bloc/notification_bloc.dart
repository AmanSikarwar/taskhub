import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/notification.dart';
import '../../domain/entities/notification_failure.dart';
import '../../domain/repositories/notification_repository.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _notificationRepository;
  StreamSubscription<List<AppNotification>>? _notificationsSubscription;
  StreamSubscription<int>? _unreadCountSubscription;

  NotificationBloc(this._notificationRepository)
    : super(const NotificationState.initial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<LoadUnreadCount>(_onLoadUnreadCount);
    on<MarkAsRead>(_onMarkAsRead);
    on<MarkAllAsRead>(_onMarkAllAsRead);
    on<DeleteNotification>(_onDeleteNotification);
    on<DeleteAllNotifications>(_onDeleteAllNotifications);
    on<WatchNotifications>(_onWatchNotifications);
    on<NotificationsUpdated>(_onNotificationsUpdated);
    on<UnreadCountUpdated>(_onUnreadCountUpdated);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(.loading(unreadCount: state.unreadCount));

    final result = await _notificationRepository.getNotifications(
      limit: event.limit,
    );

    if (result.failure != null) {
      emit(.error(result.failure!, unreadCount: state.unreadCount));
    } else {
      emit(
        .loaded(
          notifications: result.notifications ?? [],
          unreadCount: state.unreadCount,
        ),
      );
    }
  }

  Future<void> _onLoadUnreadCount(
    LoadUnreadCount event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _notificationRepository.getUnreadCount();

    if (result.count != null) {
      emit(state.copyWithUnreadCount(result.count!));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _notificationRepository.markAsRead(
      event.notificationId,
    );

    if (result.failure != null) {
      emit(.error(result.failure!, unreadCount: state.unreadCount));
    } else {
      add(const .loadNotifications());
      add(const .loadUnreadCount());
    }
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    final failure = await _notificationRepository.markAllAsRead();

    if (failure != null) {
      emit(.error(failure, unreadCount: state.unreadCount));
    } else {
      add(const .loadNotifications());
      add(const .loadUnreadCount());
    }
  }

  Future<void> _onDeleteNotification(
    DeleteNotification event,
    Emitter<NotificationState> emit,
  ) async {
    final failure = await _notificationRepository.deleteNotification(
      event.notificationId,
    );

    if (failure != null) {
      emit(.error(failure, unreadCount: state.unreadCount));
    } else {
      add(const .loadNotifications());
      add(const .loadUnreadCount());
    }
  }

  Future<void> _onDeleteAllNotifications(
    DeleteAllNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    final failure = await _notificationRepository.deleteAllNotifications();

    if (failure != null) {
      emit(.error(failure, unreadCount: state.unreadCount));
    } else {
      emit(const .loaded(notifications: [], unreadCount: 0));
    }
  }

  void _onWatchNotifications(
    WatchNotifications event,
    Emitter<NotificationState> emit,
  ) {
    _notificationsSubscription?.cancel();
    _notificationsSubscription = _notificationRepository
        .streamNotifications()
        .listen((notifications) => add(.notificationsUpdated(notifications)));

    _unreadCountSubscription?.cancel();
    _unreadCountSubscription = _notificationRepository
        .streamUnreadCount()
        .listen((count) => add(.unreadCountUpdated(count)));
  }

  void _onNotificationsUpdated(
    NotificationsUpdated event,
    Emitter<NotificationState> emit,
  ) {
    emit(
      NotificationState.loaded(
        notifications: event.notifications,
        unreadCount: state.unreadCount,
      ),
    );
  }

  void _onUnreadCountUpdated(
    UnreadCountUpdated event,
    Emitter<NotificationState> emit,
  ) {
    emit(state.copyWithUnreadCount(event.count));
  }

  @override
  Future<void> close() {
    _notificationsSubscription?.cancel();
    _unreadCountSubscription?.cancel();
    return super.close();
  }
}

extension NotificationStateX on NotificationState {
  int get unreadCount => when(
    initial: () => 0,
    loading: (unreadCount) => unreadCount,
    loaded: (notifications, unreadCount) => unreadCount,
    error: (failure, unreadCount) => unreadCount,
  );

  List<AppNotification> get notifications => maybeWhen(
    loaded: (notifications, unreadCount) => notifications,
    orElse: () => [],
  );

  NotificationState copyWithUnreadCount(int unreadCount) => when(
    initial: () => .loading(unreadCount: unreadCount),
    loading: (_) => .loading(unreadCount: unreadCount),
    loaded: (notifications, _) =>
        .loaded(notifications: notifications, unreadCount: unreadCount),
    error: (failure, _) => .error(failure, unreadCount: unreadCount),
  );
}
