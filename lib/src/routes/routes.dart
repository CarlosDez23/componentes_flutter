import 'package:componentes_flutter/src/pages/card_page.dart';
import 'package:componentes_flutter/src/pages/inputs_page.dart';
import 'package:componentes_flutter/src/pages/listview_page.dart';
import 'package:componentes_flutter/src/pages/sliders_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
import 'package:componentes_flutter/src/pages/animated_container.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/'                 : (BuildContext context) => HomePage(),
    'alert'             : (BuildContext context) => AlertPage(),
    'avatar'            : (BuildContext context) => AvatarPage(),
    'card'              : (BuildContext context) => CardPage(),
    'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
    'inputs'            : (BuildContext context) => InputsPage(),
    'slider'            : (BuildContext context) => SlidersPage(),
    'list'              : (BuildContext context) => ListaPage(),
  };
}
