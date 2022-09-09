import 'package:complee/shared/botNavbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Complee'),
        ),
        body: Container(),
        bottomNavigationBar: BotNavbar(),
      ),
    );
  }
}
