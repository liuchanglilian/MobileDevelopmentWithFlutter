import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firstScreen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter email',
              prefixIcon: Icon(Icons.email)
            ),
            onChanged: (value) {
              this.email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter password',
              prefixIcon: Icon(Icons.lock)
              ),
            onChanged: (value) {
              this.password = value;
            },
            obscureText: true,
          ),
          RaisedButton(
              onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: this.email, password: this.password)
                    .then((signedInUser) {
                      Navigator.push(context,new MaterialPageRoute(builder: (context) => new FirstScreen()));
                });
//                  return Scaffold(
//                    body: Center(
//                      child: CircularProgressIndicator(),
//                    )
//                  );
              },
              textColor: Colors.white,
              child: Text('Login'),
              color: Colors.indigo)
          ],
        ),
      ),
    );
  }
}