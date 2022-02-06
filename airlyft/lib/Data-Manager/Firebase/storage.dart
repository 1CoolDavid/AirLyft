import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  static Future<void> downloadURL(String id) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('$id.jpg')
        .getDownloadURL();
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/file-to-upload.png')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }

  Future<void> uploadString() async {
    String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/hello-world.text')
          .putString(dataUrl, format: firebase_storage.PutStringFormat.dataUrl);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
