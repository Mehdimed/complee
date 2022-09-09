import 'package:complee/home/home.dart';
import 'package:complee/tache/tache.dart';
import 'package:complee/addTache/addTache.dart';

var routes = {
  '/': (context) => const Home(),
  '/addTache': (context) => const AddTache(),
  '/tache': (context) => const Tache(),
};
