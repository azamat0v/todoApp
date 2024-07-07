import 'package:flutter/material.dart';

class PlanningNumbers extends StatelessWidget {
  final int planNumbers;
  final int donePlanNumbers;

  PlanningNumbers(this.planNumbers, this.donePlanNumbers);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planNumbers < 10 ? "0$planNumbers" : "$planNumbers",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "All Tasks",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                donePlanNumbers < 10 ? "0$donePlanNumbers" : "$donePlanNumbers",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Completed",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
