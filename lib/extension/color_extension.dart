import 'package:flutter/material.dart';

extension LighterColor on Color {
  Color get lighter {
    int lighter(int value) {
      return (value + (225 - value) * 0.3).toInt();
    }

    return Color.fromARGB(255, lighter(red), lighter(green), lighter(blue));
  }

  Color get darker {
    int darker(int value) {
      return (value - (value) * 0.3).toInt();
    }

    return Color.fromARGB(255, darker(red), darker(green), darker(blue));
  }
}
