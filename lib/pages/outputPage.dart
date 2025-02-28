

import 'package:flutter/material.dart';

class ShowSuccess extends StatelessWidget {
  ShowSuccess({super.key,required this.title});

  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text(title),
      ),
    );
  }
}