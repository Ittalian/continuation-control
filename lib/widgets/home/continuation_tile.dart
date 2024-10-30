import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinuationTile extends StatelessWidget {
  final ContinuationViewModel continuationViewModel;
  final Continuation continuation;

  const ContinuationTile({
    super.key,
    required this.continuationViewModel,
    required this.continuation,
  });

  void moveEdit(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.edit,
      arguments: {
        'continuation_view_model': continuationViewModel,
        'continuation': continuation,
      },
    );
  }

  Future<void> handleDeleteContinuation() async {
    return await continuationViewModel
        .deleteContinuation(continuation.continuationId!);
  }

  Future<void> handleClickContinuationTitle(
      BuildContext context, DoingViewModel doingViewModel) async {
    await doingViewModel.fetchDoings(continuation.continuationId!);
    moveDoingIndex(context);
  }

  void moveDoingIndex(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.confirm,
      arguments: {
        'continuation_id': continuation.continuationId,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final doingViewModel = context.watch<DoingViewModel>();
    return GestureDetector(
        onTap: () async {
          await handleClickContinuationTitle(context, doingViewModel);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          color: Colors.white.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                continuation.name,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  BaseTextButton(
                      label: '編集', onPressed: () => moveEdit(context)),
                  BaseTextButton(
                    label: '削除',
                    onPressed: () async {
                      handleDeleteContinuation();
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
