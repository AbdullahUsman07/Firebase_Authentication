


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/pages/dataFunctionPages/createPage.dart';
import 'package:firebase_practice/pages/dataFunctionPages/deletePage.dart';
import 'package:firebase_practice/pages/dataFunctionPages/retrievePage.dart';
import 'package:firebase_practice/pages/dataFunctionPages/updatePage.dart';
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
                moveToPage(context, CreatePage());
              }, color: Theme.of(context).primaryColor),
              const SizedBox(height: 20,),
              CustomButton(title: 'Delete', onTap: (){
                moveToPage(context, const DeletePage());
                
              }, color: Theme.of(context).primaryColor),
              const SizedBox(height: 20,),
              CustomButton(title: 'Update', onTap: (){
                moveToPage(context, UpdatePage());
              }, color: Theme.of(context).primaryColor),
              const SizedBox(height: 20,),
              CustomButton(title: 'Retreive', onTap: (){
                moveToPage(context, RetrievePage());
              }, color: Theme.of(context).primaryColor),
              
            ],
          ),
        ),
      ),
    );
  }

   void moveToPage(BuildContext context,Widget page){
    Navigator.push(
      context,
    MaterialPageRoute(builder: (context)=> page));
  }
  
}