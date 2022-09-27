import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FireBaseStorageBtn extends StatefulWidget {
  const FireBaseStorageBtn({Key? key}) : super(key: key);

  @override
  State<FireBaseStorageBtn> createState() => _FireBaseStorageBtnState();
}

class _FireBaseStorageBtnState extends State<FireBaseStorageBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        kameraGaleriImageUpload();
      },
      child: const Text(
        "Kamera Galeri image Upload",
      ),
    );
  }

  void kameraGaleriImageUpload() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.camera);

    var profileRef = FirebaseStorage.instance.ref("user/profil_resimleri");

    var task = profileRef.putFile(File(file!.path));

    task.whenComplete(() async {
      var url = await profileRef.getDownloadURL();

      await firestore
          .doc("users/Rbe5jjGHfK5BdHCFeOBR")
          .set({"profilresim": url.toString()}, SetOptions(merge: true));
      debugPrint(url);
    });
  }
}
