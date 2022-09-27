import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriSorgulamaBtn extends StatefulWidget {
  const VeriSorgulamaBtn({Key? key}) : super(key: key);

  @override
  State<VeriSorgulamaBtn> createState() => _VeriSorgulamaBtnState();
}

class _VeriSorgulamaBtnState extends State<VeriSorgulamaBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        queryingData();
      },
      child: const Text(
        "Veri Sorgulama",
      ),
    );
  }

  void queryingData() async {
    var usersRef = firestore.collection("users");

    var sonuc = await usersRef.where("yas", isNotEqualTo: 30).get();

    for (var user in sonuc.docs) {
      debugPrint(user.data().toString());
    }

    var sirala = await usersRef.orderBy("yas", descending: true).get();

    for (var users in sirala.docs) {
      debugPrint(users.data().toString());
    }
  }
}
