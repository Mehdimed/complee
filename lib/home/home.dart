import 'package:complee/shared/botNavbar.dart';
import 'package:flutter/material.dart';
import 'package:complee/services/tachesRepository.dart';
import 'package:complee/models/tache.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Complee'),
        ),
        body: Container(
          // recuperer les taches de la base de donnees et les afficher
          child: FutureBuilder<List<Tache>>(
            future: TachesRepository().getAllTaches(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      trailing: InkWell(
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onTap: () {
                          TachesRepository()
                              .deleteTache(snapshot.data![index].id!);
                          updateState();
                        },
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        bottomNavigationBar: BotNavbar(updateHome: updateState),
      ),
    );
  }
}