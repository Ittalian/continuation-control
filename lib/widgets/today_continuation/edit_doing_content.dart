import 'package:flutter/material.dart';
import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_button.dart';
import 'package:continuation_control/widgets/base/base_numberfield.dart';
import 'package:continuation_control/widgets/base/base_textform_field.dart';
import 'package:provider/provider.dart';

class EditDoingContent extends StatefulWidget {
  final String continuationId;
  final List<Doing> doings;
  final Doing? doing;

  const EditDoingContent({
    super.key,
    required this.continuationId,
    required this.doings,
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

  Future<void> handleSaveDoing(
      BuildContext context, DoingViewModel doingViewModel) async {
    if (widget.doing == null) {
      Doing doing = Doing(
        name: name,
        currentPeriod: 0,
        maxPeriod: 0,
        goalPeriod: int.parse(goalPeriod),
      );
      await doingViewModel.addDoing(
        widget.continuationId,
        doing,
      );
    } else {
      Doing doing = Doing(
        doingId: widget.doing!.doingId,
        name: name,
        currentPeriod: widget.doing!.currentPeriod,
        maxPeriod: widget.doing!.maxPeriod,
        goalPeriod: int.parse(goalPeriod),
      );
      await doingViewModel.updateDoing(
        widget.continuationId,
        doing,
      );
    }
    await doingViewModel.fetchDoings(widget.continuationId);
    moveTodayCotinuation(context, doingViewModel);
  }

  void moveTodayCotinuation(
      BuildContext context, DoingViewModel doingViewModel) {
    Navigator.pushNamed(
      context,
      Routes.confirm,
      arguments: {
        'continuation_id': widget.continuationId,
        'doing_view_model': doingViewModel,
        'doings': doingViewModel.doings,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final doingViewModel = context.watch<DoingViewModel>();
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
              await handleSaveDoing(context, doingViewModel);
            },
          ),
        ],
      ),
    );
  }
}
