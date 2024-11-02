import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/views/confirm/confirm.dart';
import 'package:continuation_control/views/edit/edit.dart';
import 'package:continuation_control/views/home/index.dart';
import 'package:continuation_control/views/today_continuation/add_doing.dart';
import 'package:continuation_control/views/today_continuation/edit_doing.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/home';
  static const String edit = '/edit';
  static const String add = '/add';
  static const String confirm = '/confirm';
  static const String addDoing = 'add_doing';
  static const String editDoing = 'edit_doing';

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
            continuationViewModel:
                editOptions['continuation_view_model'] as ContinuationViewModel,
            continuation: editOptions['continuation'] as Continuation,
          ),
        );
      case add:
        final addOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => Edit(
              continuationViewModel: addOptions['continuation_view_model']
                  as ContinuationViewModel),
        );
      case confirm:
        final confirmOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => Confirm(
            continuationId: confirmOptions['continuation_id'] as String,
            doingViewModel:
                confirmOptions['doing_view_model'] as DoingViewModel,
            doings: confirmOptions['doings'] as List<Doing>,
          ),
        );
      case addDoing:
        final addDoingOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => AddDoing(
            continuationId: addDoingOptions['continuation_id'] as String,
            doings: addDoingOptions['doings'] as List<Doing>,
          ),
        );
      case editDoing:
        final editDoingOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => EditDoing(
            continuationId: editDoingOptions['continuation_id'] as String,
            doings: editDoingOptions['doings'] as List<Doing>,
            doing: editDoingOptions['doing'] as Doing,
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
