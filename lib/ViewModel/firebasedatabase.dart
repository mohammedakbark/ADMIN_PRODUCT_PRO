import 'package:adminpanel_hardwarepro/Model/productmodel.dart';
import 'package:adminpanel_hardwarepro/Model/usermodel.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseDatabase with ChangeNotifier {
  final db = FirebaseFirestore.instance;

//-----------------------------------------add--

  Future addProduct(ProductModel productModel, context) async {
    final docs = db.collection("product").doc();
    docs.set(productModel.toJson(docs.id)).then((v) {
      showSuccessMessage(context, "Product added successfully");
      Navigator.of(context).pop();
      notifyListeners();
    });
  }

  listen() {
    notifyListeners();
  }

  //-------------------------------------------fetch data
  List<UserModel> userList = [];

  fetchAllUser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("User").get();

    userList = snapshot.docs.map((e) {
      return UserModel.fromJson(e.data());
    }).toList();
  }

  List<ProductModel> productList = [];
  Future fetchAllProduct() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("product").get();
    productList = snapshot.docs.map((e) {
      return ProductModel.fromJson(e.data());
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

  deleteSelectedProduct(proId) {
    db.collection("product").doc(proId).delete();
    notifyListeners();
  }
}
