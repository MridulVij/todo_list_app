import 'package:flutter/material.dart';

class DateTimePicker {
// before taking input from user or we can say initial stage
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

// after taking input from user
  DateTime? _userSelectedDate;
  TimeOfDay? _userSelectedTime;

  DateTime? get getDate => _userSelectedDate;
  TimeOfDay? get getTime => _userSelectedTime;

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      _userSelectedDate = picked;
    }
//
    final TimeOfDay? ispicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      // error was here
      _userSelectedTime = ispicked;
    }
  }

  bool isMatchingDateTime() {
    final now = DateTime.now();
    return true;
    // now.month == getDate.month &&
    //     now.year == getDate.year &&
    //     now.timeZoneName == getDate.timeZoneName &&
    //     now.second == getDate.second;
  }
}
