import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/firebase/firebase_auth.dart';
import 'package:firebase_practice/pages/databPage.dart';
import 'package:firebase_practice/pages/signupPage.dart';
import 'package:firebase_practice/validation/validationLogic.dart';
import 'package:firebase_practice/widgets/customInput.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService auth = AuthService();

  CheckValidation validation = CheckValidation();
  bool islogin = true;

  String? emailError;
  String? passwordError;

  String email = "@gmail.com";
  String password = "*****";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(
                title: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                errorText: validation.email.error,
                onChanged: (value) {
                  validation.validateEmail(value);
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(
                title: 'Password',
                isPass: true,
                controller: _passwordController,
                obscureText: true,
                errorText: validation.password.error,
                onChanged: (value) {
                  validation.validatePassword(value);
                  setState(() {
                    password = value;
                    islogin = true;
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(170, 50),
                  ),
                  onPressed: (validation.isValidLogin && islogin)
                      ? () {
                          _emailController.clear();
                          _passwordController.clear();
                          FocusScope.of(context).unfocus();
                          _login();
                          setState(() {
                            islogin = false;
                          });
                        }
                      : null,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      child: const Text('Register')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    User? user = await auth.loginUser(email, password);

    if (user != null) {
      Fluttertoast.showToast(msg: 'Login Successful');

      // a slight delay before navigating to the next page

      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const DataPage()));
      });
    }
  }
}
