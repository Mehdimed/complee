import 'package:Complee/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Complee/routes.dart';

void main() async {
  runApp(const Complee());
}

class Complee extends StatelessWidget {
  const Complee({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: mainTheme,
    );
  }
}
