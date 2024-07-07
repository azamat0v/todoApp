import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planning_app/widgets/bottom_screen.dart';

import 'package:planning_app/widgets/planning_date.dart';
import 'package:planning_app/widgets/planning_list.dart';
import 'widgets/planning_numbers.dart';
import 'models/planning_models.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const planningApp();
  }
}

class planningApp extends StatelessWidget {
  const planningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.teal),
      home: const PlanningApp(),
    );
  }
}

class PlanningApp extends StatefulWidget {
  const PlanningApp({super.key});

  @override
  State<PlanningApp> createState() => _PlanningAppState();
}

class _PlanningAppState extends State<PlanningApp> {
  Plans _lists = Plans();
  DateTime _selectedDate = DateTime.now();

  void _datePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  void _changeDate() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month, _selectedDate.day - 1);
    });
  }

  void _changeDataRight() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month, _selectedDate.day + 1);
    });
  }

  void _markDone(String planId) {
    setState(() {
      _lists
          .todoByDay(_selectedDate)
          .firstWhere((list) => list.id == planId)
          .toggleDone();
    });
  }

  void _removePlan(String planId) {
    setState(() {
      _lists.removeTodo(planId);
    });
  }

  void addTodo(String title, DateTime day) {
    setState(() {
      _lists.todoAdd(title, day);
    });
  }

  void _showAddplanScreen(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return BottomScreen(addTodo);
        });
  }

  int get _planNumbers {
    return _lists.todoByDay(_selectedDate).length;
  }

  int get _donePlanNumbers {
    return _lists.todoByDay(_selectedDate).where((plan) => plan.isDone).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ToDo App"),
      ),
      body: Column(
        children: [
          PlanningDate(
              _datePicker, _selectedDate, _changeDate, _changeDataRight),
          PlanningNumbers(_planNumbers, _donePlanNumbers),
          PlanningList(_lists.todoByDay(_selectedDate), _markDone, _removePlan),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddplanScreen(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
