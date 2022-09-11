import 'package:flutter/material.dart';
import 'package:complee/services/colors.dart';

class Tache extends StatelessWidget {
  const Tache({super.key});

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String name = arguments['name'];
    int total = arguments['total'];
    int completed = arguments['completed'];
    int id = arguments['id'];

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
                  '$completed/$total',
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
                      value: completed / total,
                      color: getColor(completed, total),
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
                      print('toucher');
                    },
                    onPanCancel: () {
                      print('fin');
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
                      print('toucher');
                    },
                    onPanCancel: () {
                      print('fin');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
