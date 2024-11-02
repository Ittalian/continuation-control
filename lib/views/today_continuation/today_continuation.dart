import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/today_continuation_tile.dart';
import 'package:flutter/material.dart';
import 'package:continuation_control/utils/constants/widgets.dart'
    as constant_widgets;
import 'package:provider/provider.dart';

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
    final doingViewModel = context.watch<DoingViewModel>();
    doingViewModel.fetchDoings(continuationId);
    return BaseImageContainer(
      imagePath: 'images/today_continuation.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: doingViewModel.doings.isEmpty
            ? constant_widgets.emptyWidget
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var doing in doingViewModel.doings)
                      TodayContinuationTile(
                        continuationId: continuationId,
                        doing: doing,
                      ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'add_doing',
          onPressed: () => moveAddDoing(context),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
