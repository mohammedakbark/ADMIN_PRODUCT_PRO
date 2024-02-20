import 'package:adminpanel_hardwarepro/Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseDatabase with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  List<UserModel> userList = [];
  //-------------------------------------------fetch data
  fetchAllUser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("User").get();

    userList = snapshot.docs.map((e) {
      return UserModel.fromJson(e.data());
    }).toList();
  }

  //--------------------------------------------delete data

  deleteUser(docId) async {
    final CollectionReference addressRef =
        db.collection("User").doc(docId).collection("adress");

    _deleteCollection(addressRef);
    db.collection("User").doc(docId).delete();

    fetchAllUser();
    notifyListeners();
  }

  Future<void> _deleteCollection(
      CollectionReference collectionReference) async {
    final QuerySnapshot snapshot = await collectionReference.get();

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (doc.exists) {
        await doc.reference.delete();
      }
    }
  }
}
