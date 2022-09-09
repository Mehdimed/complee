import 'package:flutter/material.dart';

class BotNavbar extends StatelessWidget {
  const BotNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/addTache');
          },
          child: Icon(
            Icons.add_circle_outline,
            color: Theme.of(context).colorScheme.onSurface,
            size: 40,
          ), // other widget
        ),
      ),
    );
  }
}
