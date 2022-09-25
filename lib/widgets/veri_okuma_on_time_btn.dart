import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriOkumaOnTimeBtn extends StatefulWidget {
  const VeriOkumaOnTimeBtn({Key? key}) : super(key: key);

  @override
  State<VeriOkumaOnTimeBtn> createState() => _VeriOkumaOnTimeBtnState();
}

class _VeriOkumaOnTimeBtnState extends State<VeriOkumaOnTimeBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        veriOkuOnTime();
      },
      child: const Text(
        "Veri Okuma On Time",
      ),
    );
  }

  void veriOkuOnTime() async {
    var usersDocuments = await firestore.collection("users").get();

    debugPrint(usersDocuments.size.toString());
    //?koleksiyomuzda kactane dokuman varsa adetini verir
    debugPrint(usersDocuments.docs.length.toString());

    var documentsList = usersDocuments.docs;

    for (var document in documentsList) {
      debugPrint("dokuman id: ${document.id}");

      Map usersMap = document.data();
      debugPrint(usersMap["isim"]);
    }

    var tahaDoc = await firestore.doc("users/Rbe5jjGHfK5BdHCFeOBR").get();

    debugPrint(tahaDoc.data()!["adres"]["il"].toString());
  }
}
