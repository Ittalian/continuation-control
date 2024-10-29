import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/today_continuation_tile.dart';
import 'package:flutter/material.dart';

class TodayContinuation extends StatelessWidget {
  final List<Doing> doings;

  const TodayContinuation({
    super.key,
    required this.doings,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/today_continuation.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var doing in doings)
                TodayContinuationTile(doing: doing),
            ],
          ),
        ),
      ),
    );
  }
}
