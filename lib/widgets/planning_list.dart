import 'package:flutter/material.dart';
import 'package:planning_app/models/planning_models.dart';

import 'package:planning_app/widgets/plan.dart';

class PlanningList extends StatelessWidget {
  final List<PlanModel> lists;
  final Function markDone;
  final Function removePlan;
  const PlanningList(this.lists, this.markDone, this.removePlan);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: lists.length > 0
          ? ListView.builder(
              itemBuilder: ((ctx, index) {
                return Plan(lists[index], markDone, removePlan);
              }),
              itemCount: lists.length,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hozircha hech narsa yo'q...",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/sleep.png",
                  fit: BoxFit.cover,
                  width: 150.0,
                )
              ],
            ),
    );
  }
}
