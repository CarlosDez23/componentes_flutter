import 'package:flutter/material.dart';
//Internacionalización
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes_flutter/src/routes/routes.dart';
import 'package:componentes_flutter/src/pages/alert_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComponentesApp',
      debugShowCheckedModeBanner: false,
      //Internacionalización
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), 
        const Locale('es', 'ES'),
      ],
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