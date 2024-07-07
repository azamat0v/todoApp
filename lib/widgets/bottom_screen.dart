import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomScreen extends StatefulWidget {
  final Function addTodo;
  BottomScreen(this.addTodo);
  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  DateTime? _todoSelectedDate;
  final _todoNameController = TextEditingController();

  void _openCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((selectedModalScreenDate) {
      if (selectedModalScreenDate != null) {
        setState(() {
          _todoSelectedDate = selectedModalScreenDate;
        });
      }
    });
  }

  void submit() {
    if (_todoNameController.text.isEmpty || _todoSelectedDate == null) {
      return;
    }
    widget.addTodo(_todoNameController.text, _todoSelectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom
              : 100,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title of Plan..."),
              controller: _todoNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _todoSelectedDate == null
                      ? "Not Selected"
                      : DateFormat("EEEE, d MMM, yyyy")
                          .format(_todoSelectedDate!),
                ),
                TextButton(
                    onPressed: () {
                      _openCalendar(context);
                    },
                    child: Text("Pick Date"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text("Add"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
