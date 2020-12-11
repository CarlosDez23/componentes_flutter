import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  //Inicializamos el estado del Widget como el ONCREATE
  @override
  void initState() {
    super.initState();
    //Nada más crearse la página, meto diez items
    _add10img();
    //Se dispara cada vez que se haga scroll
    _scrollController.addListener(() {
      /* Si el máximo scroll de la pantalla es de x pixels y los pixels de la posicion actual
      son iguales a x entonces hemos llegado al final del scroll */
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }
  //Cuando se destruye la página como el ONDESTROY
  @override
  void dispose() {
    super.dispose();
    //Dejamos de escuchar para que no haya fugas de memoria
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        /*El stack es como las row y column pero los apila todos juntos*/ 
        children: [
          _createList(),
          _loading(),
        ],
      )    
    );
  }

  Widget _createList(){
    return RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index){
          final img = _numberList[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$img'),
            placeholder: AssetImage('assets/loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> refresh() async{
    final duration = new Duration(seconds:2);
    new Timer(duration,(){
      _numberList.clear();
      _lastItem++;
      _add10img();
    });
    return Future.delayed(duration);
  }

  void _add10img(){
    for(int i = 0; i< 10; i++){
      _lastItem++;
      _numberList.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    //La duración y el callback de cuando se termine esa duración 
    return new Timer(duration, httpResponse);
  }

  void httpResponse(){
    //Han pasado dos segundos, dejo de cargar
    _isLoading = false;
    //Muevo el scroll
    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    //Agrego diez imágenes
    _add10img();
  }

  /*
   * Función para crear una animación de loading, si está cargando
   * lo pintamos, si no devolvemos un container vacío porque siempre
   * hay que devolver un Widget
   */
  Widget _loading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              CircularProgressIndicator()
            ] 
          ),
          SizedBox(height: 15.0),
        ],
      );
    }else{
      return Container();
    }
  }
}