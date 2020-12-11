import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/providers/menu_provider.dart';
import 'package:componentes_flutter/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _list(),
    );
  }

  /*
   * Sacamos los  datos de nuestro provider utilizando FutureBuilder
   */
  Widget _list() {
    return FutureBuilder(
      //Lo que vamos a consultar que puede tardar
      future: menuProvider.loadData(),
      //Datos iniciales la ponemos vacía para que no de problemas 
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItems(snapshot.data, context),
        );
      }
    );
  }

  /*Recorremos los datos montando nuestro ListTile*/ 
  List<Widget> _createItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((opt) {
      final Widget aux = ListTile(
        title: Text(opt["texto"]),
        leading: getIcon(opt["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap:(){ 
          //Navegación a otras pantallas
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      options..add(aux)..add(Divider());
    });
    return options;
  }
}