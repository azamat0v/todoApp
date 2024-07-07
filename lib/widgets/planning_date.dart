import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlanningDate extends StatelessWidget {
  final Function datePicker;
  final DateTime selectedDate;
  final Function() changeDate;
  final Function() changeDateRight;

  const PlanningDate(this.datePicker, this.selectedDate, this.changeDate,
      this.changeDateRight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: changeDate,
          icon: const Icon(
            Icons.arrow_left,
            size: 35,
          ),
        ),
        TextButton(
          onPressed: () {
            datePicker(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              children: [
                TextSpan(
                  text: "${DateFormat.EEEE().format(selectedDate)}, ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: DateFormat("d MMM").format(selectedDate),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: changeDateRight,
            icon: const Icon(
              Icons.arrow_right,
              size: 35,
            ))
      ],
    );
  }
}
