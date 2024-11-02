import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
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
  final DoingViewModel doingViewModel;
  final List<Doing> doings;

  const Confirm({
    super.key,
    required this.continuationId,
    required this.doingViewModel,
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
        ConfirmBar(
          doings: widget.doings,
          continuationId: widget.continuationId,
        ),
        ConfirmProgress(
          doings: widget.doings,
          continuationId: widget.continuationId,
        ),
        TodayContinuation(
          doings: widget.doings,
          continuationId: widget.continuationId,
        ),
      ];
    });
  }

  moveHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.home,
      (Route<dynamic> route) => false,
    );
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
        floatingActionButton: FloatingActionButton(
          heroTag: 'home',
          onPressed: moveHome,
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
