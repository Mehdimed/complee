import 'package:complee/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:complee/routes.dart';

void main() {
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
