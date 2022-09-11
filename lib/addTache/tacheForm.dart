import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Complee/models/tache.dart';
import 'package:Complee/services/tachesRepository.dart';

class TacheForm extends StatefulWidget {
  const TacheForm({super.key});

  @override
  State<TacheForm> createState() => _TacheFormState();
}

class _TacheFormState extends State<TacheForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final totalController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    totalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrez un nom';
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Total',
              ),
              controller: totalController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrez un nombre';
                }
                return null;
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  TachesRepository().insertTache(Tache(
                      id: null,
                      name: nameController.text,
                      total: int.parse(totalController.text),
                      completed: 0));
                  Navigator.pop(context);
                }
              },
              child: Text('Ajouter tache'),
            ),
          ],
        ),
      ),
    );
  }
}
