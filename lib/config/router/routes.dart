import 'package:continuation_control/views/home/index.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Index(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                '${settings.name}は存在しません',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}
