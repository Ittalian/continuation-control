import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoingProgressFactor extends StatelessWidget {
  final Doing doing;

  const DoingProgressFactor({
    super.key,
    required this.doing,
  });

  @override
  Widget build(BuildContext context) {
    final doingViewModel = context.watch<DoingViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          doing.name,
          style: const TextStyle(fontSize: 15),
        ),
        BaseTextButton(
          label: '継続達成',
          onPressed: () async {
            doingViewModel.updateDoing(
              Doing(
                doingId: doing.doingId,
                continuationId: doing.continuationId,
                name: doing.name,
                maxPeriod: doing.maxPeriod,
                currentPeriod: doing.currentPeriod + 1,
                goalPeriod: doing.goalPeriod,
              ),
            );
          },
        ),
      ],
    );
  }
}
