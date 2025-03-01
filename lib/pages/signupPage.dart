import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/firebase_auth.dart';
import 'package:firebase_practice/pages/loginPage.dart';
import 'package:firebase_practice/validation/validationLogic.dart';
import 'package:firebase_practice/widgets/customInput.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  CheckValidation validator = CheckValidation();

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _recheckcontroller = TextEditingController();


  AuthService auth = AuthService();

  String username = '';
  String email = '';
  String password = '';

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _recheckcontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Signup',style: TextStyle(fontSize: 25),),
                const SizedBox(height: 20,),
                CustomFormFeild(
                  title: 'Username',
                   controller: _namecontroller,
                   errorText: validator.username.error,
                   onChanged: (value){
                    validator.validateUserName(value);
                    setState(() {
                      username = value;
                    });
                   },),
                const SizedBox(
                  height: 20,
                ),
                CustomFormFeild(
                  title: 'Email', 
                  controller: _emailcontroller,
                  errorText: validator.email.error,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    validator.validateEmail(value);
                    setState(() {
                      email = value;
                    });
                  },),
                const SizedBox(
                  height: 20,
                ),
                CustomFormFeild(
                  title: 'Password',
                  controller: _passcontroller,
                  isPass: true,
                  obscureText: true,
                  errorText: validator.password.error,
                  onChanged: (value){
                    validator.validatePassword(value);
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormFeild(
                  title: 'Re-enter Passwrod',
                  controller: _recheckcontroller,
                  obscureText: true,
                  isPass: true,
                  errorText: validator.recheck.error,
                  onChanged: (value){
                    validator.validateRecheck(value);
                    setState(() {
                      
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(170, 50),
                    ),
                    onPressed: validator.isValidRegister?() {

                      _emailcontroller.clear();
                      _passcontroller.clear();
                      _namecontroller.clear();
                      _recheckcontroller.clear();

                      FocusScope.of(context).unfocus();
                     _signup();
                    }:null,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already Have an Account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                        },
                        child: const Text('Login')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signup()async{

    User? user = await auth.signupUser(email, password);

    if(user!= null){
      return Fluttertoast.showToast(msg: 'User Registered Successfully');
    }
  }

  
}
