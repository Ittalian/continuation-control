import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/today_continuation_tile.dart';
import 'package:flutter/material.dart';
import 'package:continuation_control/utils/constants/widgets.dart'
    as constant_widgets;

class TodayContinuation extends StatelessWidget {
  final String continuationId;
  final List<Doing> doings;

  const TodayContinuation({
    super.key,
    required this.continuationId,
    required this.doings,
  });

  moveAddDoing(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.addDoing,
      arguments: {
        'continuation_id': continuationId,
        'doings': doings,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/today_continuation.jpg',
      child: doings.isEmpty
          ? constant_widgets.emptyWidget
          : Scaffold(
              backgroundColor: Colors.white.withOpacity(0),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var doing in doings)
                      TodayContinuationTile(
                        continuationId: continuationId,
                        doings: doings,
                        doing: doing,
                      ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => moveAddDoing(context),
                child: const Icon(Icons.add),
              ),
            ),
    );
  }
}
