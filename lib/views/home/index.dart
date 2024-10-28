import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/widgets/base/base_bottom_navigation_bar.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/home/home_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:continuation_control/utils/constants/images_pathes.dart' as images_pathes;
import 'package:continuation_control/utils/constants/bar_lists.dart' as bar_lists;

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> {
  var selectIndex = 0;

  void onTapItem(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void moveAdd(
      BuildContext context, ContinuationViewModel continuationViewModel) {
    Navigator.pushNamed(
      context,
      Routes.add,
      arguments: {
        'continuation_view_model': continuationViewModel,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContinuationViewModel>(
      builder: (context, continuationViewModel, child) {
        final continuationMap = continuationViewModel.continuationMap;

        final pages = [
          HomeIndex(
            continuationViewModel: continuationViewModel,
            continuations: continuationMap['in_progress'] ?? [],
          ),
          HomeIndex(
            continuationViewModel: continuationViewModel,
            continuations: continuationMap['completed'] ?? [],
          ),
          HomeIndex(
            continuationViewModel: continuationViewModel,
            continuations: continuationMap['pending'] ?? [],
          ),
        ];

        return BaseImageContainer(
          imagePath: images_pathes.index[selectIndex],
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white.withOpacity(0),
            body: pages[selectIndex],
            bottomNavigationBar: BaseBottomNavigationBar(
              onTapItem: onTapItem,
              selectIndex: selectIndex,
              barList: bar_lists.index,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => moveAdd(context, continuationViewModel),
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
