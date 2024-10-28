import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/widgets/home/continuation_tile.dart';
import 'package:flutter/material.dart';

class HomeIndex extends StatelessWidget {
  final List<Continuation> continuations;

  const HomeIndex({
    super.key,
    required this.continuations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          for (var continuation in continuations)
            ContinuationTile(continuation: continuation),
        ]),
      ),
    );
  }
}
