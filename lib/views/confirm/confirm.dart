import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/views/today_continuation/today_continuation.dart';
import 'package:continuation_control/widgets/base/base_bottom_navigation_bar.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/confirm/confirm_bar.dart';
import 'package:continuation_control/widgets/confirm/confirm_progress.dart';
import 'package:flutter/material.dart';
import 'package:continuation_control/utils/constants/images_pathes.dart'
    as image_pathes;
import 'package:continuation_control/utils/constants/bar_lists.dart'
    as bar_lists;

class Confirm extends StatefulWidget {
  final String continuationId;
  final List<Doing> doings;

  const Confirm({
    super.key,
    required this.continuationId,
    required this.doings,
  });

  @override
  State<StatefulWidget> createState() => ConfirmState();
}

class ConfirmState extends State<Confirm> {
  var selectIndex = 0;
  List<Widget> pages = [];

  void onTapItem(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      pages = [
        ConfirmBar(doings: widget.doings),
        ConfirmProgress(doings: widget.doings),
        TodayContinuation(
          continuationId: widget.continuationId,
          doings: widget.doings,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: image_pathes.confirm[selectIndex],
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: pages[selectIndex],
        bottomNavigationBar: BaseBottomNavigationBar(
          onTapItem: onTapItem,
          selectIndex: selectIndex,
          barList: bar_lists.confirm,
        ),
      ),
    );
  }
}
