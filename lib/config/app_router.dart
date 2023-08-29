import 'package:enuadminpannel/core/auth/screen/login_screen.dart';
import 'package:enuadminpannel/modules/adoption_form/adoption_form_screen.dart';
import 'package:enuadminpannel/modules/dash_board/dash_board_screen.dart';
import 'package:enuadminpannel/modules/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const login = "/login";
  static const dashboard = "/dashboard";
  static const adoption = "/adoption";
  static const notification = "/notification";

  static final key = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('Current Route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());

      case AppRouter.login:
        return _navigate(const LoginScreen());

      case AppRouter.dashboard:
        return _navigate(const DashBoardScreen());

      case AppRouter.adoption:
        return _navigate(const AdoptionFormScreen());

      case AppRouter.notification:
        return _navigate(const NotificationScreen());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Under development'),
            ),
            body: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'This Screen is currently under development!',
                    textAlign: TextAlign.center,
                  )
                ])));
  }

  static _navigate(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }

  static pushAndReplace(String route) {
    key.currentState!
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static popAndPush(String route) {
    pop();
    key.currentState!.pushNamed(route);
  }

  static push(String route) {
    key.currentState!.pushNamed(route);
  }

  static pop({dynamic value}) {
    key.currentState!.pop(value);
  }
}
