import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/utils/priority_picker.dart';
import '../view/widgets/custom_button_container.dart';
import 'package:flutter/material.dart';

class Helper {
  CustomButtonContainer customButtonContainer = CustomButtonContainer();
  PriorityPicker priorityPicker = PriorityPicker();

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format = DateFormat('h:mm a');
    return format.format(dateTime);
  }

  String formatDateTime(DateTime dateTime) {
    final format = DateFormat('d MMMM');
    return format.format(dateTime);
  }

  showPrioritySetBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customButtonContainer
                        .customColorfulContainer(1, Text('Low'), () {
                      print('low');
                      priorityPicker.prioritySetter = 1;
                      Navigator.of(context).pop();
                    }),
                    customButtonContainer
                        .customColorfulContainer(2, Text('Medium'), () {
                      print('Medium');
                      priorityPicker.prioritySetter = 2;
                      Navigator.of(context).pop();
                    }),
                    customButtonContainer
                        .customColorfulContainer(3, Text('High'), () {
                      print('High');
                      priorityPicker.prioritySetter = 3;
                      Navigator.of(context).pop();
                    }),
                  ]),
            ),
          ],
        );
      },
    );
  }
}
