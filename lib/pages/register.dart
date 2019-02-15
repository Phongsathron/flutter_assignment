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
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => this.email = value
    );

    TextFormField passwordField = TextFormField(
      decoration: InputDecoration(
        labelText: "Password"
      ),
      obscureText: true,
      onSaved: (value) => this.password = value
    );

    TextFormField passwordConfirmField = TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm password"
      ),
      obscureText: true,
      onSaved: (value) => this.confirmPassword = value
    );

    RaisedButton submitRaisedButton = RaisedButton(
      child: Text("Continue"),
      textColor: Colors.white,
      onPressed: (){
      },
    );

    ButtonTheme submitButton = ButtonTheme(
      minWidth: double.infinity,
      buttonColor: Colors.pink,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: submitRaisedButton,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            decoration: new BoxDecoration(color: Colors.amber[200]),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: <Widget>[
                emailField,
                passwordField,
                passwordConfirmField,
                SizedBox(height: 15),
                submitButton
              ],
            ),
          )
        )
    );
  }

}