import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BatchKavramiBtn extends StatefulWidget {
  const BatchKavramiBtn({Key? key}) : super(key: key);

  @override
  State<BatchKavramiBtn> createState() => _BatchKavramiBtnState();
}

//* batch kelimesini denildi mi toplu yapilan islemleri aklimiza gelsin
//* burada toplu veri ekleme silme ve guncelleme islemlerini yapcagiz
class _BatchKavramiBtnState extends State<BatchKavramiBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        batchKavrami();
      },
      child: const Text(
        "Batch Kavrami",
      ),
    );
  }

  void batchKavrami() async {
    WriteBatch batch = firestore.batch();

    CollectionReference counterColRef = firestore.collection("counter");

    //*toplu eleman(Dokuman ekleme)
    /*  for (var i = 0; i < 100; i++) {
      var yeniDoc = counterColRef.doc();
      batch.set(yeniDoc, {"sayac": ++i, "id": yeniDoc.id});
    }
    */
    //*Toplu Guncelleme Islemi Yapma
    /* var counterDocs = await counterColRef.get();
    counterDocs.docs.forEach((element) {
      batch.update(element.reference, {
        "createdAt": FieldValue.serverTimestamp(),
      });
    });
    */

    //*Toplu Silme Islemi
    var counterDocs = await counterColRef.get();
    for (var element in counterDocs.docs) {
      batch.delete(element.reference);
    }

    await batch.commit();
  }
}
