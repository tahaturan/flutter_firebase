import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionKavramiBtn extends StatefulWidget {
  const TransactionKavramiBtn({Key? key}) : super(key: key);

  @override
  State<TransactionKavramiBtn> createState() => _TransactionKavramiBtnState();
}

class _TransactionKavramiBtnState extends State<TransactionKavramiBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        transactionKavrami();
      },
      child: const Text(
        "Transaction Kavrami",
      ),
    );
  }

  void transactionKavrami() async {
    //*biden fazla ard arda gelen islemleri tek bir seferde yapmamizi sagliyor
    //*burda onemli olan o anki anlik veri
    //*para transfer ornegi yapalim
    firestore.runTransaction((transaction) async {
      DocumentReference<Map<String, dynamic>> muhammedRef =
          firestore.doc("users/wZiw9AamuoCTFDEwa2nt");
      DocumentReference<Map<String, dynamic>> tahaRef =
          firestore.doc("users/Rbe5jjGHfK5BdHCFeOBR");

      var muhammedSnapshot = await transaction.get(muhammedRef);

      var muhammedBakiye = muhammedSnapshot.data()!["para"];

      if (muhammedBakiye > 100) {
        var muhammedYeniBakiye = muhammedSnapshot.data()!["para"] - 100;

        transaction.update(muhammedRef, {"para": muhammedYeniBakiye});
        transaction.update(tahaRef, {"para": FieldValue.increment(100)});
      }
    });
  }
}
