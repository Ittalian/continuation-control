import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/widgets/confirm/confirm_progress_factor.dart';
import 'package:flutter/material.dart';

class ConfirmProgress extends StatelessWidget {
  final List<Doing> doings;

  const ConfirmProgress({
    super.key,
    required this.doings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var doing in doings) ConfirmProgressFactor(doing: doing),
      ],
    );
  }
}
