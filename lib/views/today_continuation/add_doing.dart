import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/today_continuation/edit_doing_content.dart';
import 'package:flutter/material.dart';

class AddDoing extends StatelessWidget {
  final String continuationId;
  final DoingViewModel doingViewModel;

  const AddDoing({
    super.key,
    required this.continuationId,
    required this.doingViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/add_doing.jpg',
      child: EditDoingContent(
        continuationId: continuationId,
        doingViewModel: doingViewModel,
      ),
    );
  }
}

