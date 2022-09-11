import 'package:flutter/material.dart';
import 'package:Complee/services/colors.dart';
import 'package:Complee/services/tachesRepository.dart';
import 'package:Complee/models/tache.dart';
import 'dart:async';

class Tache extends StatefulWidget {
  const Tache({super.key});

  @override
  State<Tache> createState() => _TacheState();
}

class _TacheState extends State<Tache> {
  var tacheCompleted;
  // timer
  late Timer timer1;
  late Timer timer2;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String name = arguments['name'];
    int total = arguments['total'];
    int completed = arguments['completed'];
    int id = arguments['id'];

    // initialiser la valeur de tacheCompleted a completed la premiere fois
    if (tacheCompleted == null) {
      tacheCompleted = completed;
    }

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Hero(
          tag: id,
          child: Card(
            elevation: 6,
            margin:
                const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 10),
            borderOnForeground: true,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 50,
                  left: 25,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${tacheCompleted != null ? tacheCompleted : completed}/$total',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: CircularProgressIndicator(
                      value: tacheCompleted != null
                          ? tacheCompleted / total
                          : completed / total,
                      color: getColor(
                          tacheCompleted == null ? completed : tacheCompleted,
                          total),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      strokeWidth: 20,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 180,
                  left: 25,
                  child: GestureDetector(
                    onPanDown: (details) {
                      setState(() {
                        isPressed = true;
                        if (tacheCompleted != null && tacheCompleted > 0) {
                          tacheCompleted--;
                        }

                        timer1 = Timer.periodic(Duration(milliseconds: 100),
                            (timer) {
                          if (tacheCompleted != null && tacheCompleted > 0) {
                            setState(() {
                              tacheCompleted--;
                            });
                          }
                        });

                        Future.delayed(Duration(seconds: 2), () {
                          if (isPressed == true) {
                            timer1.cancel();
                            timer2 = Timer.periodic(Duration(milliseconds: 30),
                                (timer) {
                              if (tacheCompleted != null &&
                                  tacheCompleted > 0) {
                                setState(() {
                                  tacheCompleted--;
                                });
                              }
                            });
                          }
                        });
                      });
                    },
                    onPanCancel: () {
                      isPressed = false;
                      timer1.cancel();
                      timer2.cancel();
                    },
                    onPanUpdate: (details) {
                      isPressed = false;
                      timer1.cancel();
                      timer2.cancel();
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      ),
                      onPressed: () {},
                      child: Text('-'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 180,
                  right: 25,
                  child: GestureDetector(
                    onPanDown: (details) {
                      setState(() {
                        isPressed = true;
                        if (tacheCompleted != null && tacheCompleted < total) {
                          tacheCompleted++;
                        }
                        // initiate a timer to increment the value of tacheCompleted
                        // every 100ms
                        timer1 = Timer.periodic(Duration(milliseconds: 100),
                            (timer) {
                          if (tacheCompleted != null &&
                              tacheCompleted < total) {
                            setState(() {
                              tacheCompleted++;
                            });
                          }
                        });

                        Future.delayed(Duration(seconds: 2), () {
                          if (isPressed == true) {
                            timer1.cancel();
                            timer2 = Timer.periodic(Duration(milliseconds: 30),
                                (timer) {
                              if (tacheCompleted != null &&
                                  tacheCompleted < total) {
                                setState(() {
                                  tacheCompleted++;
                                });
                              }
                            });
                          }
                        });
                      });
                    },
                    onPanCancel: () {
                      isPressed = false;
                      timer1.cancel();
                      timer2.cancel();
                    },
                    onPanUpdate: (details) {
                      isPressed = false;
                      timer1.cancel();
                      timer2.cancel();
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      ),
                      onPressed: () {},
                      child: Text('+'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      //upadte tache
                      TachesRepository().updateTache(id, tacheCompleted);
                      // retourner a la page precedente et mettre a jour la liste des taches
                      Navigator.pop(context);
                    },
                    child: Text('Enregistrer'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
