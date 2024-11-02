import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_button.dart';
import 'package:continuation_control/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayContinuationTile extends StatefulWidget {
  final String continuationId;
  final Doing doing;

  const TodayContinuationTile({
    super.key,
    required this.continuationId,
    required this.doing,
  });

  @override
  State<TodayContinuationTile> createState() => TodayContinuationTileState();
}

class TodayContinuationTileState extends State<TodayContinuationTile> {
  int currentPeriod = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentPeriod = widget.doing.currentPeriod;
    });
  }

  void moveEditDoing(BuildContext context, DoingViewModel doingViewModel) {
    Navigator.pushNamed(
      context,
      Routes.editDoing,
      arguments: {
        'continuation_id': widget.continuationId,
        'doings': doingViewModel.doings,
        'doing': widget.doing,
      },
    );
  }

  Future<void> handleUpdateDoing(DoingViewModel doingViewModel) async {
    await doingViewModel.updateDoing(
      widget.continuationId,
      Doing(
        doingId: widget.doing.doingId,
        name: widget.doing.name,
        maxPeriod: widget.doing.maxPeriod,
        currentPeriod: widget.doing.currentPeriod + 1,
        goalPeriod: widget.doing.goalPeriod,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('継続を更新しました'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> handleCanelDoing(DoingViewModel doingViewModel) async {
    await doingViewModel.updateDoing(
      widget.continuationId,
      Doing(
        doingId: widget.doing.doingId,
        name: widget.doing.name,
        maxPeriod: widget.doing.maxPeriod,
        currentPeriod: 0,
        goalPeriod: widget.doing.goalPeriod,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('継続を断念しました'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final doingViewModel = context.watch<DoingViewModel>();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Colors.white.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.doing.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                  label: '継続達成',
                  onPressed: () async {
                    await handleUpdateDoing(doingViewModel);
                    setState(() {
                      currentPeriod += 1;
                    });
                  },
                ),
                BaseButton(
                  label: '断念',
                  onPressed: () async {
                    await handleCanelDoing(doingViewModel);
                    setState(() {
                      currentPeriod = 0;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseTextButton(
                label: '編集',
                onPressed: () => moveEditDoing(context, doingViewModel),
              ),
              Text(
                '$currentPeriod日継続中',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
