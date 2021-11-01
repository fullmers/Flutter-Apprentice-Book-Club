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
    refreshListenable: appStateManager,
    redirect: (GoRouterState state) {
      if (!appStateManager.isInitialized) {
        // If not initialized and not on the splash page,
        // go to the splash page.
        if (state.subloc != Routes.splash.path) {
          return Routes.splash.path;
        }
        // Staying on the splash page while initializing
        // is correct.
        return null;
      }

      if (state.subloc == Routes.splash.path) {
        return Routes.home.path;
      }

      // No redirect.
      return null;
    },
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      // ignore: avoid_print
      print('Error state: ${state.error}');
      // Showing the splash page on an error is a poor practice - but we'll
      // leave what page to show here as an exercise for the reader.
      return SplashPage.page(key: state.pageKey);
    });
