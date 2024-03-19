import 'package:flutter/material.dart';

class CustomButtonContainer {
  Widget customColorfulContainer(
    int setPriority,
    Widget childWidget,
    VoidCallback onPress,
  ) {
    return Ink(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: (setPriority == 1)
            ? const Color.fromARGB(20, 76, 175, 79)
            : (setPriority == 2)
                ? const Color.fromARGB(20, 255, 153, 0)
                : const Color.fromARGB(20, 244, 67, 54),
      ),
      child: InkWell(
        splashColor: (setPriority == 1)
            ? Colors.green
            : (setPriority == 2)
                ? Colors.orange
                : Colors.red,
        onTap: onPress,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
