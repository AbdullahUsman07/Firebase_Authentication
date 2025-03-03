
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService{

  final _auth = FirebaseAuth.instance;

  Future<User?> signupUser(String email,String password) async{

    try{
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      return cred.user;
    }
    catch(e){
      print("SomeThing went wrong");
    }
  }

  

  Future<User?> loginUser(String email, password)async{

    try{
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);

      return cred.user;
    }
    catch(e){
      print('Something went wrong');
    }
  }
}