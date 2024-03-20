import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker {
// before taking input from user or we can say initial stage
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

// after taking input from user
  DateTime? _userSelectedDateTime;
  TimeOfDay? _userSelectedTime;

  // set setTime(TimeOfDay value) {
  //   _selectedTime = value;
  // }

  // set setDate(DateTime value) {
  //   _selectedDate = value;
  // }

  get getDateTime => _userSelectedDateTime;
  // get getDate => _userSelectedDate;

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate)
      _userSelectedDateTime = picked;
//
    final TimeOfDay? ispicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      // error was here
      _userSelectedTime = ispicked;
  }
}
