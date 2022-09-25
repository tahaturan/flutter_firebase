import 'package:flutter/material.dart';
import 'package:flutter_firebase/widgets/veri_ekle_add_btn.dart';
import 'package:flutter_firebase/widgets/veri_ekleme_set_btn.dart';
import 'package:flutter_firebase/widgets/veri_guncelle_btn.dart';
import 'package:flutter_firebase/widgets/veri_silme_btn.dart';

class FireStoreIslemleri extends StatefulWidget {
  const FireStoreIslemleri({Key? key}) : super(key: key);

  @override
  State<FireStoreIslemleri> createState() => _FireStoreIslemleriState();
}

class _FireStoreIslemleriState extends State<FireStoreIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore Islemleri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            VeriEkleBtn(),
            VeriEklemeSetBtn(),
            VeriGuncellemeBtn(),
            VeriSilmeBtn(),
          ],
        ),
      ),
    );
  }
}
