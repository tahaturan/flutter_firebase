import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriEkleBtn extends StatefulWidget {
  const VeriEkleBtn({Key? key}) : super(key: key);

  @override
  State<VeriEkleBtn> createState() => _VeriEkleBtnState();
}

class _VeriEkleBtnState extends State<VeriEkleBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: () {
        veriEklemeAdd();
      },
      child: const Text(
        "Veri Ekleme Add",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void veriEklemeAdd() async {
    Map<String, dynamic> eklenecekUser = {};
    eklenecekUser["isim"] = "Taha";
    eklenecekUser["yas"] = 25;
    eklenecekUser["ogrenciMi"] = true;
    eklenecekUser["adres"] = {"il": "Aydin", "ilce": "Soke"};
    eklenecekUser["renkler"] =
        FieldValue.arrayUnion(["mavi", "sari", "kirmizi"]);
    eklenecekUser["createdAt"] = FieldValue.serverTimestamp();

    await firestore.collection("users").add(eklenecekUser);

    //*Eger ben Id vermiceksem add metodunu kullaniyorum yani burda yeni bir colleksiyon olusuturuyor
  }
}
