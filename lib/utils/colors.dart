import 'package:flutter/material.dart';

const balck = Colors.black;
const white = Colors.white;
const themePurple = Color.fromRGBO(168, 83, 163, 1);
const lightGrey = Color.fromARGB(255, 73, 73, 73);
const appBgColor = Color.fromARGB(255, 208, 208, 208);
const darkRed = Color.fromARGB(255, 173, 0, 0);
const darkGreen = Color.fromARGB(255, 14, 124, 0);
const darkGrey = Color.fromARGB(255, 75, 75, 75);

Color warrentyStatusColor(String status) {
  switch (status) {
    case "PENDING":
      return Colors.amber;

    case "REJECTED":
      return darkGrey;

    case "APPROVED":
      return Colors.green;
    default:
      return Colors.black;
  }
}
