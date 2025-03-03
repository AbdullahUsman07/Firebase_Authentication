


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome User'),
        actions: [
           IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
           }, icon: const Icon(Icons.logout_rounded))
        ],
      ),
    );
  }
}