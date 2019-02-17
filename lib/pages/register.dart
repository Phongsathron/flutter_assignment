import 'package:flutter/material.dart';
import 'accounts.dart';

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
    BuildContext context1;

    TextFormField emailField = TextFormField(
      decoration: InputDecoration(
        labelText: "Email address",
        icon: Icon(Icons.email)
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => this.email = value
    );

    TextFormField passwordField = TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        icon: Icon(Icons.lock_outline)
      ),
      obscureText: true,
      onSaved: (value) => this.password = value
    );

    TextFormField passwordConfirmField = TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm password",
        icon: Icon(Icons.lock_outline)
      ),
      obscureText: true,
      onSaved: (value) => this.confirmPassword = value
    );

    RaisedButton submitRaisedButton = RaisedButton(
      child: Text("Continue"),
      textColor: Colors.white,
      onPressed: (){
        _formKey.currentState.save();
        if(email.isEmpty || password.isEmpty || confirmPassword.isEmpty){
          Accounts.showSnackBar(context1, "กรุณากรอกข้อมูลให้ครบถ้วน");
        }
        else if(password != confirmPassword){
          Accounts.showSnackBar(context1, "ยืนยันรหัสผ่านไม่ถูกต้อง");
        }
        else{
          if(Accounts.register(context1, email, password)){
            Navigator.pushNamed(context, "/");
          }
        }
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
          child: Builder(
            builder: (BuildContext context){
              context1 = context;
              return Container(
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
              );
            }
          )
        )
    );
  }

}