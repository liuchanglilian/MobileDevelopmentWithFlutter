//import 'package:flutter/material.dart';
//import 'listPage.dart';
import 'addPage.dart';
import 'authentication.dart';
import 'post.dart';
import 'package:flutter/material.dart';
import 'detailPage.dart';
import 'myListPage.dart';
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'HyperGarageSale',
//      theme: ThemeData(
//        primarySwatch: Colors.indigo
//      ),
//      home: new LoginPage(title: 'HyperGarageSale'),
//    );
//  }
//}
//
//class FirstScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('HyperGarageSale'),
//      ),
//      body: new Center(
//        child: new MyListPage()
//      ),
//      floatingActionButton: new FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new AddPage(title: 'HyperGarageSale'))
//          );
//        },
//      ),
//    );
//  }
//}





import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HyperGarageSale',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      //home: new FirstScreen(),
     home: new LoginPage(title: 'HyperGarageSale'),
    );
  }
}








