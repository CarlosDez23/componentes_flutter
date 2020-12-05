import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final _options = ['Uno', 'Dos', 'Tres', 'Cuatro','Cinco'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp')
      ),
      //Creación de un ListView
      body: ListView(
        children: _createItemShort(),
      ),
    );
  }


  /* Primera forma de modelar un listview */
  List<Widget> _createItems(){
    List<Widget> list = new List<Widget>();
    for (String option in _options) {
      final tempWidget = ListTile(
        title: Text(option)
      );
      //Operador cascada de Dart
      list..add(tempWidget)
          ..add(Divider());
    }
    return list;
  }

  /* Segunda forma de modelar un listview */ 
  /*Esta es la forma que utilizaremos, retornamos la función mapp
  que utiliza la lista y mapea como nostros queramos, en este caso 
  devolvemos una Widget que es una columna que tiene dentro un ListTile
  con diversos atributos*/ 
  List<Widget> _createItemShort(){
    //Recibe el tipo de dato del que sea la lista
    return _options.map((String data) {
      return Column(
        children: [
          ListTile(
            title: Text(data),
            subtitle: Text('Subtítulo'),
            //Lo que va al principio del Tile (icono)
            leading: Icon(Icons.account_balance_wallet),
            //Al final (flecha)
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}