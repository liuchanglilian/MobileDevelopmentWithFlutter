import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'post.dart';

List<String> urlList = new List();
class AddPage extends StatefulWidget {
  AddPage({Key key, this.title, this.record}) : super(key: key);
  final String title;
  final Post record;

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  TextEditingController _picsController = new TextEditingController();

  File _imageFile;
  String filename;
  Future _onImageButtonPressed()async {
    var selectedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = selectedImage;
      if(_imageFile != null){
        filename = basename(_imageFile.path);
      }
    });
  }

  Widget uploadArea(){
    return Column(
      children: <Widget>[
        Image.file(_imageFile, width: 200),
        RaisedButton(
          color: Colors.deepPurple,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text("Upload", style: new TextStyle(color: Colors.white),),
          onPressed: uploadImage,
        )
      ],
    );
  }

  Future<String> uploadImage() async{
    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = ref.putFile(_imageFile);

    var downUrl = await(await uploadTask.onComplete).ref.getDownloadURL();
    var url = downUrl.toString();
    print(url);
    urlList.add(url);
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
              hintText: "Enter title of the item",
              //prefixIcon: Icon(Icons.title)
            ),
            controller: _nameController,
          ),

          TextField(
            decoration: InputDecoration(
              labelText: "Price",
              hintText: "Enter Price",
              //prefixIcon: Icon(Icons.attach_money)
            ),
            controller: _priceController,
          ),

          TextField(
            decoration: InputDecoration(
              labelText: "Description",
              hintText: "Enter Description of the item",
              //prefixIcon: Icon(Icons.text_fields)
            ),
            maxLines: 10,
            controller: _descController,
          ),

          _imageFile == null?
          Center(
              child: Text("select an image", style: new TextStyle(color: Colors.white),)
          ):uploadArea(),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(1.0)
                ),
                flex: 2,
              ),
              RaisedButton(
                color: Colors.deepPurple,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child:
                Text("IMAGE", style: new TextStyle(color: Colors.white)),
                onPressed: () =>{
                  _onImageButtonPressed()
                },
              ),


              Expanded(
                child: Container(
                    padding: EdgeInsets.all(1.0)
                ),
                flex: 10,
              ),

              new MyButton(
                nController:_nameController,
                pController:_priceController,
                dController:_descController,
              ),


              Expanded(
                child: Container(
                    padding: EdgeInsets.all(1.0)
                ),
                flex: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton( {
    Key key,
    this.nController, this.pController, this.dController
  }) : super(key: key);
  final TextEditingController nController;
  final TextEditingController pController;
  final TextEditingController dController;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text("POST",
          style: new TextStyle(color: Colors.white)
      ),
      color: Colors.deepPurple,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed: () {
        Map<String,dynamic> map = new Map();
        map['name'] = nController.text;
        map['price'] = int.parse(pController.text);
        map['desc'] = dController.text;
        map['pictures'] = urlList;
        Firestore.instance.collection('sales').add(map);

        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("You have posted an item"),
          duration: new Duration(seconds: 2),
          backgroundColor: Colors.deepPurple,
          action: new SnackBarAction(
            label: "Close",
            textColor: Colors.white,
            onPressed: () {
            },
          ),
        ));
      },
    );
  }
}
//import 'dart:io';
//import 'dart:async';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:path/path.dart';
//import 'post.dart';
//
//class AddPage extends StatefulWidget {
//  AddPage({Key key, this.title, this.record}) : super(key: key);
//  final String title;
//  final Record record;
//  @override
//  _AddPageState createState() => _AddPageState();
//}
//
//class _AddPageState extends State<AddPage> {
//  TextEditingController _nameController = new TextEditingController();
//  TextEditingController _priceController = new TextEditingController();
//  TextEditingController _descController = new TextEditingController();
//  List<String> urlList = new List();
//  File _imageFile;
//  String filename;
//  Future _onImageButtonPressed() async {
//    var selectedImage =
//        await ImagePicker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      _imageFile = selectedImage;
//      if (_imageFile != null) {
//        filename = basename(_imageFile.path);
//      }
//    });
//  }
//
//  Widget uploadArea() {
//    return Column(
//      children: <Widget>[
//        Image.file(_imageFile, height: 300),
//        Text(
//          "You have uploaded " + urlList.length.toString() + " pictures",
//          style: new TextStyle(color: Colors.indigo),
//        ),
//        RaisedButton(
//          color: Colors.indigo,
//          child: Text(
//            "Upload",
//            style: new TextStyle(color: Colors.white),
//          ),
//          onPressed: uploadImage,
//        )
//      ],
//    );
//  }
//
//
//  Future<String> uploadImage() async {
//    print("aaa");
//    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
//    StorageUploadTask uploadTask = ref.putFile(_imageFile);
//
//    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
//    var url = downUrl.toString();
//    print("cur url is:" +url);
//    urlList.add(url);
//    return url;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: ListView(
//        children: <Widget>[
//          TextField(
//            decoration: InputDecoration(
//                labelText: "Title",
//                hintText: "Enter title of the item",
//                prefixIcon: Icon(Icons.title)),
//            controller: _nameController,
//          ),
//          TextField(
//            decoration: InputDecoration(
//                labelText: "Price",
//                hintText: "Enter Price",
//                prefixIcon: Icon(Icons.attach_money)),
//            controller: _priceController,
//          ),
//          TextField(
//            decoration: InputDecoration(
//                labelText: "Description",
//                hintText: "Enter Description of the item",
//                prefixIcon: Icon(Icons.text_fields)),
//            maxLines: 10,
//            controller: _descController,
//          ),
//          _imageFile == null
//              ? Center(
//                  child: SizedBox(
//                    height: 360,
//                    child: Text(
//                      "Please select images",
//                      style: new TextStyle(color: Colors.indigo),
//                    ),
//                  ),
//                )
//              : uploadArea(),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Expanded(
//                child: Container(padding: EdgeInsets.all(1.0)),
//                flex: 2,
//              ),
//              RaisedButton(
//                color: Colors.indigo,
//                child:
//                    Text("Select", style: new TextStyle(color: Colors.white)),
//                onPressed: () => {_onImageButtonPressed()},
//              ),
//              Expanded(
//                child: Container(padding: EdgeInsets.all(1.0)),
//                flex: 10,
//              ),
//              new MyButton(
//                nController: _nameController,
//                pController: _priceController,
//                dController: _descController,
//                list: urlList,
//              ),
//              Expanded(
//                child: Container(padding: EdgeInsets.all(1.0)),
//                flex: 2,
//              ),
//            ],
//          )
//        ],
//      ),
//    );
//  }
//}
//
//
//class MyButton extends StatelessWidget {
//  MyButton(
//      {Key key,
//      this.nController,
//      this.pController,
//      this.dController,
//      this.list})
//      : super(key: key);
//  final TextEditingController nController;
//  final TextEditingController pController;
//  final TextEditingController dController;
//  final List<String> list;
//
//  @override
//  Widget build(BuildContext context) {
//    return new RaisedButton(
//      child: new Text("POST", style: new TextStyle(color: Colors.white)),
//      color: Colors.indigo,
//      onPressed: () {
//        Map<String, dynamic> map = new Map();
//        map['name'] = nController.text;
//        map['price'] = int.parse(pController.text);
//        map['desc'] = dController.text;
//        print("building button: usl size is"+(list.length).toString());
//        map['pictures'] = list;
//
//        Firestore.instance.collection('product').add(map);
//
//        Scaffold.of(context).showSnackBar(new SnackBar(
//          content: new Text("You have posted an item"),
//          duration: new Duration(seconds: 2),
//          backgroundColor: Colors.indigo,
//          action: new SnackBarAction(
//            label: "Close",
//            textColor: Colors.white,
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
//        ));
//        Navigator.pop(context);
//      },
//    );
//  }
//}
