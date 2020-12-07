import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page')
      ),
      body: ListView(
        //Damos padding por todos los lados 
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
        ]
      )
    );
  }

  //Construcción de un tipo de card
  Widget _cardTypeOne(){
    return Card(
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Título de la card'),
            subtitle: Text('Descripción de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _cardTypeTwo(){
  return Card(
    child: Column(
      children: [
        FadeInImage(
          image: NetworkImage('https://i.redd.it/tk46u5nrkxm21.png'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300.0,
          fit: BoxFit.cover,
        ),
        /*
        Image(
          image: NetworkImage('https://i.redd.it/tk46u5nrkxm21.png')
        ),
        */
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Título de la foto')
        ),
      ],
    )

  );
}