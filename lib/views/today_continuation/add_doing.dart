import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/edit_doing_content.dart';
import 'package:flutter/material.dart';

class AddDoing extends StatelessWidget {
  final String continuationId;
  final List<Doing> doings;

  const AddDoing({
    super.key,
    required this.continuationId,
    required this.doings,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/add_doing.jpg',
      child: EditDoingContent(
        continuationId: continuationId,
        doings: doings,
      ),
    );
  }
}
