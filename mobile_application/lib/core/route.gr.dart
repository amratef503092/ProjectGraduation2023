// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../main.dart' as _i1;
import '../view/pages/PostsPage.dart' as _i3;
import '../view/pages/SettingsPage.dart' as _i4;
import '../view/pages/userPage.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.DashboardPage(),
      );
    },
    UsersRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.UsersPage(),
      );
    },
    PostRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PostPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          DashboardRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              UsersRoute.name,
              path: 'users',
              parent: DashboardRoute.name,
            ),
            _i5.RouteConfig(
              PostRoute.name,
              path: 'posts',
              parent: DashboardRoute.name,
            ),
            _i5.RouteConfig(
              SettingsRoute.name,
              path: 'settings',
              parent: DashboardRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.UsersPage]
class UsersRoute extends _i5.PageRouteInfo<void> {
  const UsersRoute()
      : super(
          UsersRoute.name,
          path: 'users',
        );

  static const String name = 'UsersRoute';
}

/// generated route for
/// [_i3.PostPage]
class PostRoute extends _i5.PageRouteInfo<void> {
  const PostRoute()
      : super(
          PostRoute.name,
          path: 'posts',
        );

  static const String name = 'PostRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}
