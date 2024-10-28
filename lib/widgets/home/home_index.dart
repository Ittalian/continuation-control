import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/widgets/home/continuation_tile.dart';
import 'package:flutter/material.dart';

class HomeIndex extends StatelessWidget {
  final ContinuationViewModel continuationViewModel;
  final List<Continuation> continuations;

  const HomeIndex({
    super.key,
    required this.continuationViewModel,
    required this.continuations,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var continuation in continuations)
            ContinuationTile(
              continuationViewModel: continuationViewModel,
              continuation: continuation,
            ),
        ],
      ),
    );
  }
}
