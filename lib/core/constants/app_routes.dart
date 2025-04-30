import 'package:flutter/material.dart';
import 'package:flutter_movie/core/constants/route_paths.dart';
import 'package:flutter_movie/presentation/auth/pages/signin.dart';
import 'package:flutter_movie/presentation/splash/pages/splash.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        RoutePaths.splash: (context) => const SplashPage(),
        RoutePaths.signin: (context) => SigninPage(),
      };
}
