import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/today_continuation_tile.dart';
import 'package:flutter/material.dart';

class TodayContinuation extends StatelessWidget {
  final String continuationId;
  final DoingViewModel doingViewModel;

  const TodayContinuation({
    super.key,
    required this.continuationId,
    required this.doingViewModel,
  });

  moveAddDoing(BuildContext context, DoingViewModel doingViewModel) {
    Navigator.pushNamed(
      context,
      Routes.addDoing,
      arguments: {
        'continuation_id': continuationId,
        'doing_view_model': doingViewModel,
      },
    );
  }

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
              for (var doing in doingViewModel.doings)
                TodayContinuationTile(
                  continuationId: continuationId,
                  doingViewModel: doingViewModel,
                  doing: doing,
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => moveAddDoing(context, doingViewModel),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
