import 'package:cloud_firestore/cloud_firestore.dart';
class Post {
 String name;
 int price;
 String desc;
 List<dynamic> pictures;
 DocumentReference reference;

 Post.fromMap(Map<String, dynamic> map, {this.reference})
     :
      assert(map['pictures'].length != 0),
      name = map['name'],
      price = map['price'],
      desc = map['desc'],
      pictures = map['pictures'];
 Post.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);
}

//import 'package:cloud_firestore/cloud_firestore.dart';
//class Record {
// String name;
// int price;
// String desc;
// List<dynamic> pictures;
// DocumentReference reference;
//
// Record.fromMap(Map<String, dynamic> map, {this.reference})
//     : assert(map['name'] != null),
//       assert(map['price'] != null),
//       assert(map['desc'] != null),
//     //  assert(map['pictures'].length != 0),
//       name = map['name'],
//       price = map['price'],
//       desc = map['desc'],
//       pictures = map['pictures'];
// Record.fromSnapshot(DocumentSnapshot snapshot)
//     : this.fromMap(snapshot.data, reference: snapshot.reference);
//}
