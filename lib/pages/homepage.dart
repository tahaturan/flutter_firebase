import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuth auth;

  final String _email = "tahaaturann16@gmail.com";
  final String _password = "password123";

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter FireBase'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              createUserEmailAndPassword();
            },
            child: const Text(
              "E-mail / Sifre Kayit",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              loginUserEmailAndPassword();
            },
            child: const Text(
              "Giris ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }

  void createUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void loginUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
