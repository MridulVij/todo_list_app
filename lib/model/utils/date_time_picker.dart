import 'package:flutter/material.dart';

class DateTimePicker {
// before taking input from user or we can say initial stage
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

// after taking input from user
  DateTime? _userSelectedDate;
  TimeOfDay? _userSelectedTime;

  // set setTime(TimeOfDay value) {
  //   _selectedTime = value;
  // }

  // set setDate(DateTime value) {
  //   _selectedDate = value;
  // }

  get getTime => _userSelectedTime;
  get getDate => _userSelectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) _userSelectedDate = picked;
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) _userSelectedTime = picked;
  }
}