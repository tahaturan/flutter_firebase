import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriEklemeSetBtn extends StatefulWidget {
  const VeriEklemeSetBtn({Key? key}) : super(key: key);

  @override
  State<VeriEklemeSetBtn> createState() => _VeriEklemeSetBtnState();
}

class _VeriEklemeSetBtnState extends State<VeriEklemeSetBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        veriEkle();
      },
      child: const Text(
        "Veri Ekleme Set",
      ),
    );
  }

  void veriEkle() async {
    await firestore
        .doc("users/wZiw9AamuoCTFDEwa2nt")
        .set({"okul": "Pamukkale Universitesi"}, SetOptions(merge: true));

    //*Eger ben var olan bir verinin ustune yeni bisiler eklemek istersem set metodunu kullnanmam lazim
    //*hangi verinin ustune ekleme yapcaksam onuda doc icinde yolunu id sini belirterek yaziyoruz
    //! SetOptions(merge: true) ifadesi onemli burda benim var olan verilerim bozulmasin sadece ustune ekleme yapmak istiyorum diyoruz
    //! eger SetOptions(merge: true) sekilnde yazmazsak varolan verilerimiz silip sadece burda ekledigimiz veri olacaktir

    //*Biz Olusturulan User Id sinide verilerimiz arasinda tutmak istersek eger

    var yeniDocId = firestore.collection("users").doc().id;
    //*ilk olarak bu sekilde olustulcak olan dokuman id mizi alabiliriz

    await firestore.doc("users/$yeniDocId").set({
      //*user colleksiyonumuzun altina yenidokuman olsutur dedik ve id si yeniDocId burda bize gelen deger olsun dedik
      "kullaniciId": yeniDocId,
      //*sonrasinda da bunu verilerimiz icin de ekledik
      "isim": "taha",
      "soyisim": "turan",
      "yas": 25
    });
  }
}
