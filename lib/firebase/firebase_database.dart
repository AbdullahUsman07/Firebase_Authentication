

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

create(String colName, docName, name, qualification, age)async{
  await FirebaseFirestore.instance.collection(colName).doc(docName).set({
    'name': name,
    'age': age,
    'qualification': qualification,
  });
  Fluttertoast.showToast(msg: 'Collecion Created');
}