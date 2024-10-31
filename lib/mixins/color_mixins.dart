import 'package:flutter/material.dart';

class ColorMixins {
  Color getTileColor(double period) {
    if (period <= 0) {
      return Colors.white.withOpacity(0.5);
    } else if (period < 10) {
      return const Color.fromARGB(255, 255, 163, 194).withOpacity(0.5);
    } else if (period < 20) {
      return Colors.blueAccent.withOpacity(0.5);
    } else if (period < 30) {
      return Colors.blue.withOpacity(0.5);
    } else if (period < 40) {
      return Colors.purple.withOpacity(0.5);
    } else if (period < 50) {
      return Colors.greenAccent.withOpacity(0.5);
    } else if (period < 60) {
      return Colors.green.withOpacity(0.5);
    } else if (period < 70) {
      return Colors.yellow.withOpacity(0.5);
    } else if (period < 80) {
      return Colors.red.withOpacity(0.5);
    } else if (period < 90) {
      return const Color.fromRGBO(196, 112, 34, 0.9);
    } else if (period < 100) {
      return const Color.fromRGBO(192, 192, 192, 0.9);
    } else {
      return const Color.fromRGBO(255, 215, 0, 0.9);
    }
  }
}
