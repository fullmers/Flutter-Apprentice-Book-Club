import 'package:apod/features/splash/splash_page.dart';
import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final goRouter = GoRouter(
    initialLocation: Routes.splash.path,
    routes: [
      Routes.splash,
      Routes.home,
    ],
    urlPathStrategy: UrlPathStrategy.path,
    refreshListenable: appStateManager,
    redirect: (GoRouterState state) {
      return GoRouterRedirector.instance.redirect(state, appStateManager);
    },
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      // ignore: avoid_print
      print('Error state: ${state.error}');
      // Showing the splash page on an error is a poor practice - but we'll
      // leave what page to show here as an exercise for the reader.
      return SplashPage.page(key: state.pageKey);
    });

class GoRouterRedirector {
  const GoRouterRedirector(this._redirects);
  final List<Redirect> _redirects;

  static GoRouterRedirector get instance => GoRouterRedirector([
        UninitializedRedirect(),
        OnInitializationRedirect(),
        UpdateHomeTabRedirect(),
      ]);

  String? redirect(GoRouterState state, AppStateManager manager) {
    final current = Uri(path: state.subloc, queryParameters: state.queryParams);
    for (final redirect in _redirects) {
      if (redirect.predicate(state, manager)) {
        final uri = redirect.getNewUri(state, manager);
        if (uri != null) {
          final uriString = uri.toString();

          if (uriString == current.toString()) {
            // ignore: avoid_print
            print('$redirect attempted to redirect to itself at $uriString');
            return null;
          }

          // ignore: avoid_print
          print('$redirect redirecting from ${current.toString()} to ' +
              uriString);
          return uriString;
        }
      }
    }
    return null;
  }
}

abstract class Redirect {
  /// Determines whether this redirection should take place.
  bool predicate(GoRouterState state, AppStateManager manager);

  /// Returns an optional `Uri` instance if there is a redirect. This
  /// can return Null because `predicate` may return true if it knows there is
  /// zero chance any future redirect should be checked. For example, if the
  /// app is not initialized, you may know that your only possible redirect is
  /// *to* the splash screen. However, if you are already there, [getNewUri]
  /// will return null.
  Uri? getNewUri(GoRouterState state, AppStateManager manager);
}

/// Takes any route to the Splash screen.
class UninitializedRedirect extends Redirect {
  @override
  bool predicate(GoRouterState state, AppStateManager manager) =>
      !appStateManager.isInitialized;

  @override
  Uri? getNewUri(GoRouterState state, AppStateManager manager) {
    if (state.subloc == Routes.splash.path) return null;

    final queryParams = Map<String, String>.from(state.queryParams);
    queryParams['next'] = state.subloc;
    return Uri(
      path: Routes.splash.path,
      queryParameters: queryParams,
    );
  }
}

/// Leaves the splash screen once the app is initialized.
class OnInitializationRedirect extends Redirect {
  @override
  bool predicate(GoRouterState state, AppStateManager manager) =>
      manager.isInitialized && state.subloc == Routes.splash.path;

  @override
  Uri? getNewUri(GoRouterState state, AppStateManager manager) {
    final queryParams = Map<String, String>.from(state.queryParams);

    String next = Routes.home.path;
    if (queryParams.containsKey('next')) {
      // Grab a complete copy of the upcoming location.
      next = queryParams.remove('next')!;
      final uri = Uri(path: next, queryParameters: queryParams);

      // See if the upcoming location is the home page and mentions a tab, and
      // if so, set that tab in our manager.
      if (uri.path == Routes.home.path &&
          uri.queryParameters.containsKey('tab')) {
        appStateManager.silentlySetTab(int.parse(uri.queryParameters['tab']!));
      }
      next = uri.path;
    }
    return Uri(path: next, queryParameters: queryParams);
  }
}

class UpdateHomeTabRedirect extends Redirect {
  @override
  bool predicate(GoRouterState state, AppStateManager manager) =>
      state.subloc == Routes.home.path;

  @override
  Uri? getNewUri(GoRouterState state, AppStateManager manager) {
    if (manager.selectedTab.toString() != state.queryParams['tab']) {
      final queryParams = Map<String, String>.from(state.queryParams);
      queryParams['tab'] = appStateManager.selectedTab.toString();
      return Uri(
        path: state.subloc,
        queryParameters: queryParams,
      );
    }
  }
}
