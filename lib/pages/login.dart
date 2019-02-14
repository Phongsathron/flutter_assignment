import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final String logoPath = 'assets/images/pizza-slice.png';
  final _formKey = GlobalKey<FormState>();

  static String fieldEmptyError = 'กรุณาระบุ Username หรือ Password';
  static TextStyle fieldLabelStyle =
      TextStyle(color: Colors.black, decorationColor: Colors.black, fontWeight: FontWeight.w500);
  
  String username = '';
  String password = '';

  InputDecoration _fieldDecoration(String labelText, IconData icon){
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black)
      ),
        border: OutlineInputBorder(),
        labelText: labelText,
        icon: Icon(icon, color: Colors.black),
        labelStyle: fieldLabelStyle
    );
  }

  void _formErrorDialog(String title, String content){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("ตกลง"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // BuildContext context1;

    TextFormField usernameField = TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: _fieldDecoration('Username', Icons.person),
      onSaved: (value){
        this.username = value;
      }
    );

    TextFormField passwordField = TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: _fieldDecoration('Password', Icons.lock),
      obscureText: true,
      onSaved: (value){
        this.password = value;
      }
    );

    Container loginLogo = Container(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
      child: Image.asset(logoPath, fit: BoxFit.cover),
    );

    ButtonTheme submitButton = ButtonTheme(
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: RaisedButton(
        child: Text("Sign In"),
        color: Colors.pink[400],
        textColor: Colors.white,
        elevation: 4.0,
        onPressed: () {
          _formKey.currentState.save();
          print("${this.username} - ${this.password}");
          if (this.username.isEmpty && this.password.isEmpty) {
            _formErrorDialog("เกิดข้อผิดพลาด", "กรุณาระบุ Username และ Password");
          }
          else if(this.username == "admin" && this.password == "admin"){
            _formErrorDialog("เกิดข้อผิดพลาด", "Username หรือ Password ไม่ถูกต้อง");
          }
        },
      )
    );

    return Scaffold(
      body: Builder(
        builder: (BuildContext context){
          return Theme(
            data: Theme.of(context).copyWith(
                primaryColor: Colors.pink[400],
                accentColor: Colors.black87,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                decoration: new BoxDecoration(color: Colors.amber[200]),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        loginLogo,
                        Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black, 
                            fontSize: 20, 
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 15.0),
                        usernameField,
                        SizedBox(height: 12.0),
                        passwordField,
                        SizedBox(height: 12.0),
                        submitButton,
                        SizedBox(height: 12.0)
                      ],
                    )
                  )
                )
              )
            )
          );
        },
      ),
    );
  }
}
