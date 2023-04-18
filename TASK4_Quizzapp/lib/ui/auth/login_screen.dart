// ignore_for_file: unused_import, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/ui/auth/login_with_phone_number.dart';
import 'package:quiz_app/ui/auth/signup_screen.dart';
import 'package:quiz_app/ui/posts/post_screen.dart';
import 'package:quiz_app/ui/posts/pseudo_category.dart';
import 'package:quiz_app/ui/widgets/round_button.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
//   In Flutter, the final _formKey = GlobalKey<FormState>(); is used to create a unique key for a Form widget. This key is used to validate the form and retrieve its current state.
// The GlobalKey is a unique identifier that can be used to identify a widget across different parts of an app. In the case of a Form, it is used to access the FormState, which holds the current state of the form, including whether the form is valid or not, and which fields have been touched. The Form widget's key property should be set to the _formKey created above, so that it can be accessed later on.
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
//this func is used to remove the value in textfield when screen is off
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //used for system navigator button
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 254, 255),
        appBar: AppBar(
          automaticallyImplyLeading: false, //back jane ke liye h ye <-
          title: RichText(
              text: const TextSpan(
                  style: TextStyle(fontSize: 30),
                  children: <TextSpan>[
                TextSpan(
                    text: 'Pseudo',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(221, 51, 49, 49))),
                TextSpan(
                    text: 'Code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 9, 126, 181)))
              ])),

          backgroundColor: Colors.transparent,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.alternate_email),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return "Enter valid Email";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          controller: passController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            }
                            return null;
                          }),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                loading: loading,
                title: 'Login',
                onTap: () {
                  login();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          // MaterialPageRoute(
                          //     builder: ((context) => const SignupScreen()))
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 10),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const SignupScreen();
                            },
                          ),
                        );
                      },
                      child: const Text('Sign up'))
                ],
              ),
              //here now we are authenticating user based on phone no.
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWithPhoneNumber()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: const Center(child: Text('Login with phone')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PseudoCategory()));
  }
  //   if (_formkey.currentState!.validate()) {
  //     setState(() {
  //       loading = true;
  //     });
  //     _auth
  //         .signInWithEmailAndPassword(
  //             email: emailController.text.toString(),
  //             password: passController.text.toString())
  //         .then((value) {
  //       Utils().toastMessage(value.user!.email.toString());
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const PostScreen()));
  //     }).then((value) {
  //       setState(() {
  //         loading = false;
  //       });
  //     }).onError((error, stackTrace) {
  //       Utils().toastMessage(error.toString());
  //       setState(() {
  //         loading = false;
  //       });
  //     });
  //   }
  // }
}
