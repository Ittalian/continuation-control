import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/views/today_continuation/today_continuation.dart';
import 'package:continuation_control/widgets/base/base_bottom_navigation_bar.dart';
import 'package:continuation_control/widgets/confirm/confirm_bar.dart';
import 'package:continuation_control/widgets/confirm/confirm_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:continuation_control/utils/constants/bar_lists.dart'
    as bar_lists;

class Confirm extends StatefulWidget {
  final String continuationId;
  const Confirm({
    super.key,
    required this.continuationId,
  });

  @override
  State<StatefulWidget> createState() => ConfirmState();
}

class ConfirmState extends State<Confirm> {
  var selectIndex = 0;

  void onTapItem(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoingViewModel>(
      builder: (context, doingViewModel, child) {
        final doings = doingViewModel.doings;
        final pages = [
          ConfirmBar(doings: doings),
          ConfirmProgress(doings: doings),
          TodayContinuation(
            continuationId: widget.continuationId,
            doingViewModel: doingViewModel,
          ),
        ];

        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: pages[selectIndex],
          bottomNavigationBar: BaseBottomNavigationBar(
            onTapItem: onTapItem,
            selectIndex: selectIndex,
            barList: bar_lists.confirm,
          ),
        );
      },
    );
  }
}
