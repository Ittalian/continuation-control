import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinuationTile extends StatefulWidget {
  final ContinuationViewModel continuationViewModel;
  final Continuation continuation;
  final List<Doing> doings;
  final Color tileColor;

  const ContinuationTile({
    super.key,
    required this.continuationViewModel,
    required this.continuation,
    required this.doings,
    required this.tileColor,
  });

  @override
  State<ContinuationTile> createState() => ContinuationTileState();
}

class ContinuationTileState extends State<ContinuationTile> {
  void moveEdit(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.edit,
      arguments: {
        'continuation_view_model': widget.continuationViewModel,
        'continuation': widget.continuation,
        'doings': widget.doings,
      },
    );
  }

  Future<void> handleDeleteContinuation() async {
    return await widget.continuationViewModel
        .deleteContinuation(widget.continuation.continuationId!);
  }

  Future<void> fetchDoings(DoingViewModel doingViewModel, String continuationId) async {
    doingViewModel.fetchDoings(continuationId);
  }

  moveDoingIndex(BuildContext context, DoingViewModel doingViewModel) {
    Navigator.pushNamed(
      context,
      Routes.confirm,
      arguments: {
        'continuation_id': widget.continuation.continuationId,
        'doing_view_model': doingViewModel,
        'doings': widget.doings,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final doingViewModel = context.watch<DoingViewModel>();
    return GestureDetector(
      onTap: () async {
        await fetchDoings(doingViewModel, widget.continuation.continuationId!);
        moveDoingIndex(
          context,
          doingViewModel,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        color: widget.tileColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.continuation.name,
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                BaseTextButton(label: '編集', onPressed: () => moveEdit(context)),
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
      ),
    );
  }
}
