import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/widgets/base/base_bottom_navigation_bar.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/home/home_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> {
  var selectIndex = 0;
  List<String> barList = [
    '継続中',
    '完了',
    '中断',
  ];
  List<String> imagePathes = [
    'images/in_progress.jpg',
    'images/completed.jpg',
    'images/pending.jpg',
  ];

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
          imagePath: imagePathes[selectIndex],
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white.withOpacity(0),
            body: pages[selectIndex],
            bottomNavigationBar: BaseBottomNavigationBar(
              onTapItem: onTapItem,
              selectIndex: selectIndex,
              barList: barList,
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
