import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/views/home/completed_index.dart';
import 'package:continuation_control/views/home/in_progress_index.dart';
import 'package:continuation_control/views/home/pending_index.dart';
import 'package:continuation_control/widgets/base/base_bottom_navigation_bar.dart';
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

  void onTapItem(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContinuationViewModel>(
      builder: (context, continuationViewModel, child) {
        final continuationMap = continuationViewModel.continuationMap;

        final pages = [
          InProgressIndex(
            continuations: continuationMap['in_progress'] ?? [],
          ),
          CompletedIndex(
            continuations: continuationMap['completed'] ?? [],
          ),
          PendingIndex(
            continuations: continuationMap['pending'] ?? [],
          ),
        ];

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white.withOpacity(0),
          body: pages[selectIndex],
          bottomNavigationBar: BaseBottomNavigationBar(
            onTapItem: onTapItem,
            selectIndex: selectIndex,
            barList: barList,
          ),
        );
      },
    );
  }
}
