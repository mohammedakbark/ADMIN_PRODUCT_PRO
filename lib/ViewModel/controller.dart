import 'dart:io';

import 'package:adminpanel_hardwarepro/utils/objects.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Controller with ChangeNotifier{
  final firbaseStorage = FirebaseStorage.instance;

  File? productImage1;
  String? productImageURL1;
  bool isImageLoading1 = false;
  Future addProductImage() async {
    isImageLoading1 = true;
    notifyListeners();
    // DocumentReference docUpdateRef =
    //     db.collection('user').doc(FirebaseAuth.instance.currentUser!.uid);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    if (pickedFile != null) {
      final currenttime = TimeOfDay.now();
      productImage1 = File(pickedFile.path);
      UploadTask uploadTask = firbaseStorage
          .ref()
          .child("ProductImage/$currenttime")
          .putFile(productImage1!, metadata);
      TaskSnapshot snapshot = await uploadTask;
      productImageURL1 = await snapshot.ref.getDownloadURL();
      // docUpdateRef.update({"profileImage": downloadURL}).then(
      //     (value) => noti("Profile Image Updated"));
      isImageLoading1 = false;
      notifyListeners();
      return productImageURL1;
    }
  }
}
