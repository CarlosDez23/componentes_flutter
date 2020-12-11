import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  SlidersPage({Key key}) : super(key: key);

  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {

  double _sliderValue = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget> [
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  //Creación de un Slider
  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      divisions: 20,
      value: _sliderValue,
      min: 10.0, 
      max: 400.0,
      onChanged: (_blockCheck ) 
        ? null 
        : (double value){
          setState(() {
            _sliderValue = value;
          });
        }
    );
  }

  //Creación de un checkbox
  Widget _createCheckBox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (bool value){
    //     setState(() {
    //       _blockCheck = value;
    //     });
    //   }
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (bool value){
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }

  
  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (bool value){
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Akali_0.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}