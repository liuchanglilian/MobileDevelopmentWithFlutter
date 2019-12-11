
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'post.dart';
import 'detailPage.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListState createState() {
    return _MyListState();
  }
}

class _MyListState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('sales').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildList(context, snapshot.data.documents);
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 30.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Post.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
            leading:SizedBox(
              height: 100.0,
              width: 100.0,
              child: new Image.network(record.pictures[0]),
            ),
            title: Text(record.name),
            trailing: Text('\$' + record.price.toString()),
            onTap: () => {
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new DetailPage
                    (title: 'HyperGarageSale', record: record))
              )
            }
        ),
      ),
    );
  }
}