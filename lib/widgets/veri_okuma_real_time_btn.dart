import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriOkumaRealTimeBtn extends StatefulWidget {
  const VeriOkumaRealTimeBtn({Key? key}) : super(key: key);

  @override
  State<VeriOkumaRealTimeBtn> createState() => _VeriOkumaRealTimeBtnState();
}

class _VeriOkumaRealTimeBtnState extends State<VeriOkumaRealTimeBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  StreamSubscription? userSubscribe;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        veriOkuRealTime();
      },
      child: const Text(
        "Veri Okuma Real Time",
      ),
    );
  }

  void veriOkuRealTime() async {
    var userStream = await firestore.collection("users").snapshots();

    userSubscribe = userStream.listen((event) {
      event.docChanges.forEach((element) {
        debugPrint(element.doc.data().toString());
      });
    });
  }
}
