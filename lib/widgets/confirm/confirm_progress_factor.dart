import 'package:continuation_control/models/doing.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ConfirmProgressFactor extends StatefulWidget {
  final Doing doing;

  const ConfirmProgressFactor({
    super.key,
    required this.doing,
  });

  @override
  State<StatefulWidget> createState() => ConfirmProgressFactorState();
}

class ConfirmProgressFactorState extends State<ConfirmProgressFactor> {
  double progressPercent = 0;

  @override
  void initState() {
    super.initState();
    _getProgressPercent();
  }

  _getProgressPercent() {
    setState(() {
      progressPercent = (widget.doing.currentPeriod / widget.doing.goalPeriod);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white.withOpacity(0.5),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.doing.name,
            style: const TextStyle(fontSize: 20),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: progressPercent,
            center: Text("${progressPercent * 100}%"),
            progressColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
