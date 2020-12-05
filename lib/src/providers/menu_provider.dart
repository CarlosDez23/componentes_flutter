import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider();

  /*Para leer un JSON local, utilizamos Future, de manera
  que esperará a que se haga el proceso y devolverá un Future,
  el cual a su vez de vuelve la lista, así nos aseguramos de que
  los datos siempre llegen cuando los necesitemos*/
  
  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(response);
    options = dataMap['rutas'];   
    return options; 
  }
}

//Creamos una sola instancia
final menuProvider = new _MenuProvider();