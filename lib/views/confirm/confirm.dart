import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_bottom_navigation_bar.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/confirm/confirm_bar.dart';
import 'package:continuation_control/widgets/confirm/confirm_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:continuation_control/utils/constants/images_pathes.dart'
    as image_pathes;
import 'package:continuation_control/utils/constants/bar_lists.dart'
    as bar_lists;

class Confirm extends StatefulWidget {
  const Confirm({
    super.key,
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
        ];

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
      },
    );
  }
}
