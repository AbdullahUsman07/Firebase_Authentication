

import 'package:firebase_practice/pages/loginPage.dart';
import 'package:firebase_practice/pages/signupPage.dart';
import 'package:firebase_practice/widgets/customButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Firebase Authentication',style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(title: 'Login', color: Colors.black, onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),),
              const SizedBox(height: 20,),
               CustomButton(title: 'Sign Up', color:Colors.black,onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage())),),
            ],
          ),
        ),
      ),
    );
  }
}

