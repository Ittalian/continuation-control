import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/widgets/base/base_button.dart';
import 'package:flutter/material.dart';

class ContinuationTile extends StatelessWidget {
  final Continuation continuation;

  const ContinuationTile({
    super.key,
    required this.continuation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Row(
        children: [
          Text(continuation.name),
          BaseButton(label: '編集', onPressed: () {}),
          BaseButton(label: '削除', onPressed: () {}),
        ],
      ),
    );
  }
}
