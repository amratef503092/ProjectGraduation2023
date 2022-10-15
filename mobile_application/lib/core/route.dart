import 'package:auto_route/annotations.dart';
import 'package:graduation_project/main.dart';

import '../view/pages/PostsPage.dart';
import '../view/pages/SettingsPage.dart';
import '../view/pages/userPage.dart';
// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[

    AutoRoute(
      path: '/',
      page: DashboardPage,
      children: [
        AutoRoute(path: 'users', page: UsersPage),
        AutoRoute(path: 'posts', page: PostPage),
        AutoRoute(path: 'settings', page: SettingsPage),
      ],
      initial: true
    ),            ],
)
class $AppRouter {}
