import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen>{
  String email = '';
  String password = '';
  String confirmPassword = '';

  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

    TextFormField emailField = TextFormField(
      decoration: InputDecoration(
        labelText: "Email address"
      ),
      onSaved: (value) => this.email = value
    );

    TextFormField passwordField = TextFormField(
      decoration: InputDecoration(
        labelText: "Password"
      ),
      onSaved: (value) => this.password = value
    );

    TextFormField passwordConfirmField = TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm password"
      ),
      onSaved: (value) => this.confirmPassword = value
    );

    RaisedButton submitButton = RaisedButton(
      child: Text("Continue"),
      onPressed: (){
        
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: <Widget>[
                emailField,
                passwordField,
                passwordConfirmField,
                submitButton
              ],
            ),
          )
        )
    );
  }

}