import 'package:flutter/material.dart';

final _icons = <String, IconData> {
  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'donut_large'   : Icons.donut_large,
  'input'         : Icons.input,
};

/*Creamos un mapa de correspondencia entre iconos
y strings con los nombres de los mismos, de forma 
que buscamos ese icono que nos llega a la función 
en nuestro mapa*/
Icon getIcon(String iconName){
  return Icon (_icons[iconName], color: Colors.blue); 
}