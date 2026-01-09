// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/calendar/data/repositories/calendar_repository_impl.dart'
    as _i712;
import '../../features/calendar/domain/repositories/calendar_repository.dart'
    as _i241;
import '../../features/calendar/presentation/bloc/calendar_bloc.dart' as _i1021;
import '../../features/notifications/data/repositories/notification_repository_impl.dart'
    as _i361;
import '../../features/notifications/domain/repositories/notification_repository.dart'
    as _i367;
import '../../features/notifications/presentation/bloc/notification_bloc.dart'
    as _i876;
import '../../features/onboarding/data/services/onboarding_service.dart'
    as _i144;
import '../../features/projects/data/repositories/project_repository_impl.dart'
    as _i62;
import '../../features/projects/domain/repositories/project_repository.dart'
    as _i338;
import '../../features/projects/presentation/bloc/project_bloc.dart' as _i205;
import '../../features/tasks/data/repositories/task_repository_impl.dart'
    as _i20;
import '../../features/tasks/domain/repositories/task_repository.dart' as _i148;
import '../../features/tasks/presentation/bloc/task_bloc.dart' as _i841;
import '../deep_link/deep_link_handler.dart' as _i633;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i633.DeepLinkHandler>(() => _i633.DeepLinkHandler());
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabase);
    gh.lazySingleton<_i454.GoTrueClient>(() => registerModule.auth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i338.ProjectRepository>(
      () => _i62.ProjectRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i148.TaskRepository>(
      () => _i20.TaskRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i367.NotificationRepository>(
      () => _i361.NotificationRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i841.TaskBloc>(
      () => _i841.TaskBloc(gh<_i148.TaskRepository>()),
    );
    gh.lazySingleton<_i241.CalendarRepository>(
      () => _i712.CalendarRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i144.OnboardingService>(
      () => _i144.OnboardingService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i454.GoTrueClient>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i205.ProjectBloc>(
      () => _i205.ProjectBloc(gh<_i338.ProjectRepository>()),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i876.NotificationBloc>(
      () => _i876.NotificationBloc(gh<_i367.NotificationRepository>()),
    );
    gh.factory<_i1021.CalendarBloc>(
      () => _i1021.CalendarBloc(gh<_i241.CalendarRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
