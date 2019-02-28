import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:apex_stats_hub/my_colors.dart';

class ColorBarForStats extends StatelessWidget {

  final Widget text;
  final double percent;
  ColorBarForStats(this.text, this.percent);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 50,
        animation: true,
        lineHeight: 24,
        animationDuration: 2500,
        percent: percent,
        center: text,
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: MyColors.grey,
        progressColor: MyColors.orange,
      ),
    );
  }
}
