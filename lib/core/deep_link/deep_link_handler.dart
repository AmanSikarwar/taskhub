import 'dart:async';
import 'dart:developer' as developer;

import 'package:app_links/app_links.dart';
import 'package:injectable/injectable.dart';
import 'package:taskhub/core/deep_link/deep_link_config.dart';

@lazySingleton
class DeepLinkHandler {
  final AppLinks _appLinks;

  DeepLinkHandler() : _appLinks = AppLinks();

  Stream<AuthDeepLink> get authDeepLinks {
    return _appLinks.uriLinkStream.map(_parseAuthDeepLink).where((link) {
      return link.hasSessionTokens || link.hasTokenHash || link.hasError;
    });
  }

  Future<AuthDeepLink?> getInitialAuthDeepLink() async {
    try {
      final uri = await _appLinks.getInitialLink();
      if (uri == null) {
        return null;
      }

      final link = _parseAuthDeepLink(uri);
      if (link.hasSessionTokens || link.hasTokenHash || link.hasError) {
        return link;
      }
      return null;
    } catch (e) {
      developer.log(
        'Error getting initial deep link: $e',
        name: 'DeepLinkHandler',
      );
      return null;
    }
  }

  AuthDeepLink _parseAuthDeepLink(Uri uri) {
    developer.log('Parsing deep link: $uri', name: 'DeepLinkHandler');

    final params = <String, String>{};

    if (uri.fragment.isNotEmpty) {
      final fragmentParams = Uri.splitQueryString(uri.fragment);
      params.addAll(fragmentParams);
    }

    params.addAll(uri.queryParameters);

    developer.log('Parsed parameters: $params', name: 'DeepLinkHandler');

    return AuthDeepLink(
      accessToken: params['access_token'],
      refreshToken: params['refresh_token'],
      tokenHash: params['token_hash'],
      type: params['type'],
      error: params['error'],
      errorCode: params['error_code'],
      errorDescription: params['error_description'],
    );
  }
}
