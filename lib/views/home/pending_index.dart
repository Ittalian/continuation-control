import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/home/home_index.dart';
import 'package:flutter/material.dart';

class PendingIndex extends StatelessWidget {
  final List<Continuation> continuations;

  const PendingIndex({
    super.key,
    required this.continuations,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/pending.jpg',
      child: HomeIndex(
        continuations: continuations,
      ),
    );
  }
}
