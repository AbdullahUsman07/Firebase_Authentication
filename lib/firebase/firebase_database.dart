

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

create(String colName, docName, name, qualification, age)async{
  await FirebaseFirestore.instance.collection(colName).doc(docName).set({
    'name': name,
    'age': age,
    'qualification': qualification,
  });
  Fluttertoast.showToast(msg: 'Record Added');
}

delete(String colName, String docName)async{
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  Fluttertoast.showToast(msg: 'Record Deleted');
}


update(String colName, docname, feildName, var newFeild)async{
  await FirebaseFirestore.instance.collection(colName).doc(docname).update({feildName:newFeild});
  Fluttertoast.showToast(msg: 'Record Updated');
}
