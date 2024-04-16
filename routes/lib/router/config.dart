import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routes/pages/about.dart';
import 'package:routes/pages/home.dart';
import 'package:routes/pages/setting.dart';
import 'package:routes/router/pages.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: Pages.home.name,
        pageBuilder: (context, state) => const MaterialPage(child: Home())),
    GoRoute(
        path: '/about',
        name: Pages.about.name,
        pageBuilder: (context, state) => const MaterialPage(child: About())),
    GoRoute(
        path: '/setting',
        name: Pages.setting.name,
        pageBuilder: (context, state) => const MaterialPage(child: Setting())),
  ]);
}
