import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/home/home_index.dart';
import 'package:flutter/material.dart';

class InProgressIndex extends StatelessWidget {
  final List<Continuation> continuations;

  const InProgressIndex({
    super.key,
    required this.continuations,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/in_progress.jpg',
      child: HomeIndex(
        continuations: continuations,
      ),
    );
  }
}
