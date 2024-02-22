import 'dart:html';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  final firbaseStorage = FirebaseStorage.instance;
  // File? pickedFile
  String? productImageURL1;
  bool isImageLoading1 = false;
  Uint8List? imageBytes;
  Blob? blob;
  SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
  uploadFile() async {
    isImageLoading1 = true;
    notifyListeners();
    FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      final file = input.files?.first;
      if (file != null) {
        final reader = FileReader();
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((event) async {
          Uint8List data = Uint8List.fromList(reader.result as List<int>);

          imageBytes = data;

          blob = Blob([data]);
          isImageLoading1 = false;
          notifyListeners();
          try {
            const currenttime = DateTime.now;

            UploadTask uploadedTask = firbaseStorage
                .ref()
                .child("ProductImage/$currenttime")
                .putBlob(blob, metadata);
            TaskSnapshot snapshot = await uploadedTask;
            productImageURL1 = await snapshot.ref.getDownloadURL();
            print(productImageURL1);
          } catch (error) {
            print('Error uploading image to Firebase Storage: $error');
          }
        });
      }
    });
  }
  // final picker = ImagePicker();

  // Future addProductImage() async {
  //   isImageLoading1 = true;
  //   notifyListeners();

  //   final pickedData = await picker.pickImage(source: ImageSource.gallery);
  //   SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
  //   if (pickedData != null) {
  //     pickedFile = File(pickedData.path);
  //     print(pickedData.path);
  //     print(pickedFile);

  //     final currenttime = TimeOfDay.now();
  //     UploadTask uploadTask = firbaseStorage
  //         .ref()
  //         .child("ProductImage/$currenttime")
  //         .putFile(pickedFile!, metadata);

  //     TaskSnapshot snapshot = await uploadTask;
  //     productImageURL1 = await snapshot.ref.getDownloadURL();
  //   } else {
  //     print("Image Not Picked");
  //   }

  //   isImageLoading1 = false;
  //   notifyListeners();
  //   return pickedFile!.path;
  //   // // return productImageURL1;
  // }

  // File? imageFile;

  fetchImage() {
    isImageLoading1 = true;
    notifyListeners();
    FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';

    input.click();

    input.onChange.listen((event) {
      final file = input.files?.first;
      if (file != null) {
        final reader = FileReader();

        reader.readAsArrayBuffer(file);

        reader.onLoadEnd.listen((event) {
          Uint8List data = Uint8List.fromList(reader.result as List<int>);

          imageBytes = data;
          notifyListeners();
          print("--------------------");
          print(imageBytes);
          blob = Blob([data]);
          print(blob);
          isImageLoading1 = false;
          notifyListeners();
          saveToStore();
        });
      }
    });
  }

  saveToStore() async {
    try {
      final currenttime = TimeOfDay.now();

      var snapshot = await firbaseStorage
          .ref()
          .child("ProductImage/$currenttime")
          .putBlob(blob);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      productImageURL1 = downloadUrl;
      print("=====${productImageURL1}====");
      print(downloadUrl);
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
    }
  }
}
