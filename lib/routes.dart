import 'package:Complee/home/home.dart';
import 'package:Complee/tache/tache.dart';
import 'package:Complee/addTache/addTache.dart';

var routes = {
  '/': (context) => const Home(),
  '/addTache': (context) => const AddTache(),
  '/tache': (context) => const Tache(),
};
