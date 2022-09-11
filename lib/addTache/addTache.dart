import 'package:flutter/material.dart';
import 'tacheForm.dart';

import 'dart:math';

class AddTache extends StatelessWidget {
  const AddTache({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complee'),
      ),
      // create a form to add a new tache with 2 text fields (name and total) and a button to submit
      body: TacheForm(),
    );
  }
}
