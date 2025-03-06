


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/pages/dataFunctionPages/createPage.dart';
import 'package:firebase_practice/widgets/customButton.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: const Text('Welcome User'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.login_outlined))
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(title: 'Create', onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=> CreateCollection()));
              }, color: Theme.of(context).primaryColor),
              const SizedBox(height: 20,),
              CustomButton(title: 'Delete', onTap: (){}, color: Theme.of(context).primaryColor),
              const SizedBox(height: 20,),
              CustomButton(title: 'Update', onTap: (){}, color: Theme.of(context).primaryColor),
              const SizedBox(height: 20,),
              CustomButton(title: 'Retreive', onTap: (){}, color: Theme.of(context).primaryColor),
              
            ],
          ),
        ),
      ),
    );
  }
}