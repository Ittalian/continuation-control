import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/widgets/today_continuation/doing_progress_factor.dart';
import 'package:flutter/material.dart';

class TodayContinuationTile extends StatefulWidget {
  final Doing doing;

  const TodayContinuationTile({
    super.key,
    required this.doing,
  });

  @override
  State<TodayContinuationTile> createState() => TodayContinuationTileState();
}

class TodayContinuationTileState extends State<TodayContinuationTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Colors.white.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DoingProgressFactor(
            doing: widget.doing,
          ),
        ],
      ),
    );
  }
}
