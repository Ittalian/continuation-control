import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/views/edit/edit.dart';
import 'package:continuation_control/views/home/index.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String edit = '/edit';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Index(),
        );
      case edit:
        final editOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => Edit(
            continuationViewModel: editOptions['continuation_view_model'] as ContinuationViewModel,
            continuation: editOptions['continuation'] as Continuation,
          ),
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
