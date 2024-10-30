import 'package:flutter/material.dart';
import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_button.dart';
import 'package:continuation_control/widgets/base/base_numberfield.dart';
import 'package:continuation_control/widgets/base/base_textform_field.dart';

class EditDoingContent extends StatefulWidget {
  final String continuationId;
  final DoingViewModel doingViewModel;
  final Doing? doing;

  const EditDoingContent({
    super.key,
    required this.continuationId,
    required this.doingViewModel,
    this.doing,
  });

  @override
  State<EditDoingContent> createState() => EditDoingContentState();
}

class EditDoingContentState extends State<EditDoingContent> {
  String name = '';
  String goalPeriod = '';

  @override
  void initState() {
    super.initState();
    if (widget.doing != null) {
      name = widget.doing!.name;
      goalPeriod = widget.doing!.goalPeriod.toString();
    }
  }

  void setName(String value) {
    setState(() {
      name = value;
    });
  }

  void setGoalPeriod(String value) {
    setState(() {
      goalPeriod = value;
    });
  }

  Future<void> handleSaveDoing(BuildContext context) async {
    if (widget.doing == null) {
      await widget.doingViewModel.addDoing(
        Doing(
          continuationId: widget.continuationId,
          name: name,
          currentPeriod: 0,
          maxPeriod: 0,
          goalPeriod: int.parse(goalPeriod),
        ),
      );
    } else {
      await widget.doingViewModel.updateDoing(
        Doing(
          doingId: widget.doing!.doingId,
          continuationId: widget.continuationId,
          name: name,
          currentPeriod: widget.doing!.currentPeriod,
          maxPeriod: widget.doing!.maxPeriod,
          goalPeriod: int.parse(goalPeriod),
        ),
      );
    }
    moveTodayCotinuation(context);
  }

  void moveTodayCotinuation(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.confirm,
      arguments: {
        'continuation_id': widget.continuationId,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseTextformField(
            label: '名前',
            setValue: (value) => setName(value),
            initText: widget.doing?.name,
          ),
          BaseNumberfield(
            label: '目標継続日数',
            setValue: (value) => setGoalPeriod(value),
            initNumer: widget.doing?.goalPeriod.toString(),
          ),
          BaseButton(
            label: '保存',
            onPressed: () async {
              await handleSaveDoing(context);
            },
          ),
        ],
      ),
    );
  }
}
