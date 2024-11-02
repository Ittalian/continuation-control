import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/confirm/confirm_progress_factor.dart';
import 'package:flutter/material.dart';
import 'package:continuation_control/utils/constants/widgets.dart'
    as constant_widgets;
import 'package:provider/provider.dart';

class ConfirmProgress extends StatelessWidget {
  final String continuationId;
  final List<Doing> doings;

  const ConfirmProgress({
    super.key,
    required this.continuationId,
    required this.doings,
  });

  @override
  Widget build(BuildContext context) {
    final doingCiewModel = context.watch<DoingViewModel>();
    doingCiewModel.fetchDoings(continuationId);
    return doingCiewModel.doings.isEmpty
        ? constant_widgets.emptyWidget
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var doing in doingCiewModel.doings) ConfirmProgressFactor(doing: doing),
              ],
            ),
          );
  }
}
