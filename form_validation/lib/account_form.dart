import 'package:flutter/material.dart';

class AccountForm extends StatefulWidget {
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
final _formKey = GlobalKey<FormState>();
String _name = "";


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(

children: <Widget>[

  TextFormField( 
    onSaved: (String value){
      setState(() {
        
        _name = value;
      });
    },
    validator: (value){
      if(value.isEmpty){
        return "you can't have an empty name";
      }
      if(value.length<2){
        return "Name must have more than one characters";
      }
    },
    decoration: InputDecoration(  
      labelText: "Name",
      helperText: "This has to be over two characters in length"
    ),
  ),
  RaisedButton( 
    child: Text("Click"),
    onPressed: (){
      _formKey.currentState.save();
      _formKey.currentState.validate() ? 
      Scaffold.of(context)
      .showSnackBar(SnackBar(

       content: Text("This is valid")
      )) : 
         Scaffold.of(context)
      .showSnackBar(SnackBar(

        content: Text("This is not valid")
      )) ;
    },
  ),
  Text(_name)
],

      ),
    );
  }
}