import 'package:continuation_control/mixins/color_mixins.dart';
import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/widgets/home/continuation_tile.dart';
import 'package:flutter/material.dart';
import 'package:continuation_control/utils/constants/widgets.dart'
    as constant_widgets;

class HomeIndex extends StatelessWidget {
  final ContinuationViewModel continuationViewModel;
  final Map<Continuation, List<Doing>> continuationMap;

  const HomeIndex({
    super.key,
    required this.continuationViewModel,
    required this.continuationMap,
  });

  getAverage(List<Doing> doings) {
    double average = 0;
    for (var doing in doings) {
      average += (doing.currentPeriod / doing.goalPeriod) * 100;
    }
    average = average / doings.length;
    return average;
  }

  @override
  Widget build(BuildContext context) {
    return continuationMap.isEmpty
        ? constant_widgets.emptyWidget
        : SingleChildScrollView(
            child: Column(
              children: [
                for (var continuationEntry in continuationMap.entries)
                  ContinuationTile(
                    continuationViewModel: continuationViewModel,
                    continuation: continuationEntry.key,
                    doings: continuationEntry.value,
                    tileColor: ColorMixins().getTileColor(
                      getAverage(
                        continuationEntry.value,
                      ),
                    ),
                  ),
              ],
            ),
          );
  }
}
