import 'package:componentes_flutter/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/pages/alert_page.dart';

//import 'package:componentes_flutter/src/pages/home_temp.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComponentesApp',
      debugShowCheckedModeBanner: false,
      //Rutas de la aplicación
      initialRoute: '/',
      routes: getApplicationRoutes(),
      //Controlamos rutas no existentes
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        ); 
      },
    );
  }
}