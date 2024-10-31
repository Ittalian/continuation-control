import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/today_continuation/edit_doing_content.dart';
import 'package:flutter/material.dart';

class EditDoing extends StatelessWidget {
  final String continuationId;
  final DoingViewModel doingViewModel;
  final Doing doing;

  const EditDoing({
    super.key,
    required this.continuationId,
    required this.doingViewModel,
    required this.doing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: EditDoingContent(
        continuationId: continuationId,
        doingViewModel: doingViewModel,
        doing: doing,
      ),
    );
  }
}
