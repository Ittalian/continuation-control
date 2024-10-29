import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/widgets/base/base_button.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:continuation_control/widgets/base/base_select.dart';
import 'package:continuation_control/widgets/base/base_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:continuation_control/utils/constants/option_maps.dart'
    as option_maps;

class Edit extends StatefulWidget {
  final ContinuationViewModel continuationViewModel;
  final Continuation? continuation;

  const Edit({
    super.key,
    required this.continuationViewModel,
    this.continuation,
  });

  @override
  State<Edit> createState() => EditState();
}

class EditState extends State<Edit> {
  String name = '';
  String status = '';

  @override
  void initState() {
    super.initState();
    if (widget.continuation != null) {
      name = widget.continuation!.name;
      status = widget.continuation!.status;
    }
  }

  void setName(String value) {
    setState(() {
      name = value;
    });
  }

  void setStatus(String value) {
    setState(() {
      status = value;
    });
  }

  Future<void> handleSaveContinuation() async {
    if (widget.continuation == null) {
      await widget.continuationViewModel.addContinuation(
        Continuation(
          name: name,
          status: status,
        ),
      );
    } else {
      await widget.continuationViewModel.updateContinuation(
        Continuation(
          continuationId: widget.continuation!.continuationId,
          name: name,
          status: status,
        ),
      );
    }
    moveHome(context);
  }

  void moveHome(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.home,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/edit.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseTextformField(
              label: '名前',
              setValue: (value) => setName(value),
              initText: widget.continuation?.name,
            ),
            BaseSelect(
              option: option_maps.edit,
              hintText: 'ステータス',
              onSelected: (value) => setStatus(value),
              initSelect: widget.continuation?.status,
            ),
            BaseButton(
              label: '保存',
              onPressed: handleSaveContinuation,
            ),
          ],
        ),
      ),
    );
  }
}
