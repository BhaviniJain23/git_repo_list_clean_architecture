import 'package:ailoitte/app/core/error/exceptions.dart';
import 'package:ailoitte/app/features/home/presentation/pages/git_repo_list_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case initialRoute:
        return CupertinoPageRoute(
            settings: RouteSettings(name: routeSettings.name),
            builder: (_) => Container());
      case home:
        return CupertinoPageRoute(
            settings: RouteSettings(name: routeSettings.name),
            builder: (_) => const GitRepoListScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
