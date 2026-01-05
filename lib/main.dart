import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskhub/core/deep_link/deep_link_config.dart';

import 'core/deep_link/deep_link_handler.dart';
import 'core/di/injection.dart';
import 'core/env/env.dart' as env;
import 'core/router/app_router.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: env.Env.supabaseUrl,
    anonKey: env.Env.supabaseAnonKey,
    debug: kDebugMode,
  );

  await configureDependencies(AppEnv.dev);

  runApp(const TaskHubApp());
}

class TaskHubApp extends StatefulWidget {
  const TaskHubApp({super.key});

  @override
  State<TaskHubApp> createState() => _TaskHubAppState();
}

class _TaskHubAppState extends State<TaskHubApp> {
  late final AuthBloc _authBloc;
  late final GoRouter _router;
  late final DeepLinkHandler _deepLinkHandler;
  StreamSubscription? _deepLinkSubscription;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt<AuthBloc>();
    _router = createAppRouter(_authBloc);
    _deepLinkHandler = getIt<DeepLinkHandler>();

    _authBloc.add(const .checkAuthStatus());

    _handleInitialDeepLink();

    _deepLinkSubscription = _deepLinkHandler.authDeepLinks.listen(
      _handleAuthDeepLink,
    );
  }

  Future<void> _handleInitialDeepLink() async {
    final deepLink = await _deepLinkHandler.getInitialAuthDeepLink();
    if (deepLink != null) {
      _handleAuthDeepLink(deepLink);
    }
  }

  void _handleAuthDeepLink(AuthDeepLink deepLink) {
    if (deepLink.hasError) {
      return;
    }

    if (deepLink.hasTokenHash) {
      _authBloc.add(
        .handleDeepLinkTokenHash(
          tokenHash: deepLink.tokenHash!,
          type: deepLink.type ?? 'email',
        ),
      );
    } else if (deepLink.hasSessionTokens) {
      _authBloc.add(
        .handleDeepLinkSession(
          accessToken: deepLink.accessToken!,
          refreshToken: deepLink.refreshToken!,
          type: deepLink.type,
        ),
      );
    }
  }

  @override
  void dispose() {
    _deepLinkSubscription?.cancel();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: MaterialApp.router(
        title: 'TaskHub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: .dark,
          ),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}
