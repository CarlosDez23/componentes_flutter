import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _userName = '';
  String _email = '';
  String _fecha = '';
  String _optionSelected = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Fuerza', 'Super Velocidad'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget> [
          _createInput(),
          Divider(),
          _createEmailInput(),
          Divider(),
          _createPasswordField(),
          Divider(),
          _createDateInput(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _showValues(),
        ],
      ),
    );
  }

  //Creación de un input
  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      //Estilo
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Cantidad de letras: ${_userName.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (editedValue){
        setState(() {
          _userName = editedValue;
        });
       
      }
    );
  }

  //Text field para emails
  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      //Estilo
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email',
        labelText: 'email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (editedValue){
        setState(() {
          _email = editedValue;
        });
      }
    );
  }

  //TextField para passwords
  Widget _createPasswordField() {
    return TextField(
      obscureText: true,
      //Estilo
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',
        labelText: 'password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (editedValue){
        setState(() {
         // _email = editedValue;
        });
      }
    );
  }

  Widget _createDateInput(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      //Asignamos el controlador con la propiedad, con esta caja de texto
      controller: _inputFieldDateController,
      //Estilo
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  //DatePicker
  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES'),
    );
    if(picked != null){
      setState((){
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  
  //Creación de un dropdown menú
  Widget _createDropdown() {
    return Row(
      children : <Widget> [
        Expanded(
            child: DropdownButton(
              items: getDropdownOptions(),
              value: _optionSelected,
              onChanged: (optionSelected){
                setState(() {
                  _optionSelected = optionSelected;
                });
              } ,
            ),
        )
      ]
    );
  }

  List<DropdownMenuItem<String>> getDropdownOptions () {
    List<DropdownMenuItem<String>> list = new List();
    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return list;
  }

  Widget _showValues() {
    return ListTile(
      title: Text('El nombre es $_userName'),
      subtitle: Text('El email es $_email'),
      trailing: Text(_optionSelected),
    );
  }
}