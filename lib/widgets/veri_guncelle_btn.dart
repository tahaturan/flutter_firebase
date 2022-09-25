import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriGuncellemeBtn extends StatefulWidget {
  const VeriGuncellemeBtn({Key? key}) : super(key: key);

  @override
  State<VeriGuncellemeBtn> createState() => _VeriGuncellemeBtnState();
}

class _VeriGuncellemeBtnState extends State<VeriGuncellemeBtn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
      ),
      onPressed: () {
        veriGuncelleme();
      },
      child: const Text(
        "Veri Guncelleme",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void veriGuncelleme() async {
    await firestore.doc("users/wZiw9AamuoCTFDEwa2nt").update({
      "isim": "Guncel Taha",
      "ogrenciMi": false,
      //*dokumanda olmayan bir alani guncellemek istersek eger dokumanda olmadigi icin oyle bir alan olusturur ve degerimizi ekller
      "deneme": "ornekDeneme",
      //*adres kismimizdaki ilce bolumunu guncellemek icin ise sonucta adress kismimizda bir map di bu sekilde guncelleye biliriz
      "adres.ilce": "Sokeli",
      //*busekilde adresin icindeki ilce bolumune eristik ve degerini guncelledik
    });
  }
}
