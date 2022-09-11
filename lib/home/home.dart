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
                      title: Text(
                          "${snapshot.data![index].name} - ${snapshot.data![index].completed}/${snapshot.data![index].total}"),
                      subtitle: LinearProgressIndicator(
                        value: snapshot.data![index].completed /
                            snapshot.data![index].total,
                        color: getColor(snapshot.data![index].completed,
                            snapshot.data![index].total),
                      ),
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
