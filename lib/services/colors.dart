import 'package:flutter/material.dart';

Color? getColor(int completed, int total) {
  double ratio = (completed / total);
  if (ratio > 0.8) {
    return Color(0x9F13FF2B);
  }
  if (ratio > 0.5) {
    return Color(0x9FEBFF13);
  }
  if (ratio > 0.25) {
    return Color(0x9fFFA113);
  }
  if (ratio > 0) {
    return Color(0x9fFD0000);
  }
  return null;
}
