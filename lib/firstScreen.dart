import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'post.dart';
import 'myListPage.dart';
import 'addPage.dart';

class Indicator extends StatelessWidget {
  Indicator({
    this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  final PageController controller;

  final int itemCount;

  final Color normalColor = Colors.indigo;

  final Color selectedColor = Colors.blue;

  final double size = 8.0;

  final double spacing = 4.0;

  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page.round() % pageCount : 0);

    return new Container(
      height: size,
      width: size + (2 * spacing),
      child: new Center(
        child: new Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HyperGarageSale'),
      ),
      body: new Center(
          child: new MyListPage()
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new AddPage(title: 'HyperGarageSale'))
          );
        },
      ),
    );
  }
}
//class FirstScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('HyperGarageSale'),
//      ),
//      body: new Center(
//          child: new MyListPage()
//      ),
//      floatingActionButton: new FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          Navigator.push(
//              context,
//              new MaterialPageRoute(builder: (context) => new AddPage(title: 'HyperGarageSale'))
//          );
//        },
//      ),
//    );
//  }
//}