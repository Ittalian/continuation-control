import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/edit_doing_content.dart';
import 'package:flutter/material.dart';

class EditDoing extends StatelessWidget {
  final String continuationId;
  final List<Doing> doings;
  final Doing doing;

  const EditDoing({
    super.key,
    required this.continuationId,
    required this.doings,
    required this.doing,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/edit_doing.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: EditDoingContent(
          continuationId: continuationId,
          doings: doings,
          doing: doing,
        ),
      ),
    );
  }
}
