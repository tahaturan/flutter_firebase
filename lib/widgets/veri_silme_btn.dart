import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriSilmeBtn extends StatefulWidget {
  const VeriSilmeBtn({Key? key}) : super(key: key);

  @override
  State<VeriSilmeBtn> createState() => _VeriSilmeBtnState();
}

class _VeriSilmeBtnState extends State<VeriSilmeBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        veriSil();
      },
      child: const Text(
        "Veri Silme",
      ),
    );
  }

  void veriSil() async {
    await firestore.doc("users/q1NAIqpO2Khs9vAYXrKN").delete();
  }
}
