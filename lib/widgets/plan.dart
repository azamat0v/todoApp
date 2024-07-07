import 'package:flutter/material.dart';
import 'package:planning_app/models/planning_models.dart';

class Plan extends StatelessWidget {
  final PlanModel plan;
  final Function markDone;
  final Function removePlan;

  Plan(this.plan, this.markDone, this.removePlan);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 6),
      leading: IconButton(
        onPressed: () {
          markDone(plan.id);
        },
        icon: Icon(
          plan.isDone ? Icons.check_circle_outlined : Icons.circle_outlined,
          color: plan.isDone ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        plan.name,
        style: TextStyle(
          color: plan.isDone ? Colors.grey : Colors.black,
          fontWeight: FontWeight.w600,
          decoration:
              plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
          onPressed: () {
            removePlan(plan.id);
          },
          icon: const Icon(Icons.delete_forever_rounded)),
    );
  }
}
