import 'package:flutter/material.dart';
import 'post.dart';
import 'bannerGallery.dart';
class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title, this.record}) : super(key: key);
  final String title;
  final Post record;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
        new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      //Image.network(widget.record.pictures[0]),
                      new BannerGalleryWidget(record: widget.record),
                      Text(""),
                      Text(widget.record.name + " :                      \$ " +widget.record.price.toString(),
                        style: new TextStyle(
                          fontSize: 27.0,
                        ),
                      ),
                      Text(""),
                      Text(""),
                      Text(widget.record.desc,
                        textAlign: TextAlign.justify,
                        style: new TextStyle(
                            fontSize: 20.0
                        ),
                      )
                    ],
                  )
              ),
            ),
          ],
        )
    );
  }
}
//class DetailPage extends StatefulWidget {
//  DetailPage({Key key, this.title, this.record}) : super(key: key);
//  final String title;
//  final Record record;
//
//  @override
//  _DetailPageState createState() => _DetailPageState();
//}
//
//class _DetailPageState extends State<DetailPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body:
//        new ListView(
//          children: <Widget>[
//            new Container(
//              padding: EdgeInsets.all(10.0),
//              child: Center(
//                child: Column(
//                  children: <Widget>[
//                    new BannerGalleryWidget(record: widget.record),
//                    Text(""),
//                    Text(widget.record.name,
//                      textAlign: TextAlign.justify,
//                      style: new TextStyle(
//                        fontSize: 24.0,
//                      ),
//                    ),
//                    Text(""),
//                    Text("\$" + widget.record.price.toString(),
//                      textAlign: TextAlign.justify,
//                      style: new TextStyle(
//                        fontSize: 20.0,
//                        fontStyle: FontStyle.italic
//                      ),
//                    ),
//                    Text(""),
//                    Text(widget.record.desc,
//                      textAlign: TextAlign.justify,
//                      style: new TextStyle(
//                        fontSize: 16.0
//                      ),
//                    )
//                  ],
//                )
//              ),
//            ),
//          ],
//        )
//    );
//  }
//}