import 'package:flutter/material.dart';
import 'package:complee/services/tachesRepository.dart';
import 'package:complee/models/tache.dart';

class AddTache extends StatelessWidget {
  const AddTache({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complee'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            TachesRepository()
                .insertTache(Tache(name: 'test', total: 10, completed: 0));
            Navigator.pushNamed(context, '/');
          },
          child: Text('ajouter une tache'),
        ),
      ),
    );
  }
}
