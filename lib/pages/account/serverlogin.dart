import 'dart:convert';
import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project/pages/account/serverforgetpassword.dart';
import 'package:project/pages/account/serverregister.dart';
import '../main/explorer/explorer.dart';
import 'package:http/http.dart' as http;


class ServerLoginPage extends StatefulWidget {
  const ServerLoginPage({super.key});

  @override
  State<ServerLoginPage> createState() => _ServerLoginPageState();
}

class _ServerLoginPageState extends State<ServerLoginPage> {
  bool _secureText = true;

  //bool? isCheck = false;

  //RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  String namevalue = '';

  String passwordvalue = '';

  //TextEditingController email = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final String _errorMessage = '';

  TimeOfDay startTime = TimeOfDay.now();

  TimeOfDay endTime = TimeOfDay.now();
  final formKey = GlobalKey<FormState>();

  Future<void> connectAndPerformOperations() async {
    try {
      String EmailForDB = email.text;
      String PasswordForDB = password.text;
      Crypt HashedPassword =
          Crypt.sha256(PasswordForDB, salt: 'abcdefghijklmnop');
      String HashedPasswordString = HashedPassword.toString();

      final response = await http.post(
        Uri.parse('http://10.0.2.2:7687/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Connection': 'Keep-Alive'
        },
        body: jsonEncode({
          'password': HashedPasswordString,
          'email': EmailForDB,
        }),
      );

      if (response.statusCode == 200) {
        Map status = json.decode(response.body);
        if (status['status'] == 'Incorrect email or password'){
          showTopSnackBar1(context);
          password.clear();
        }
        else {
          String UID = status['uid'];
          SchedulerBinding.instance.addPostFrameCallback((_) {
              Flushbar(
                icon: const Icon(
                  Icons.message,
                  size: 32,
                  color: Colors.white,
                ),
                shouldIconPulse: false,
                padding: const EdgeInsets.all(24),
                //title: '',
                message: 'Login success',
                flushbarPosition: FlushbarPosition.TOP,
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                duration: const Duration(seconds: 3),
                barBlur: 20,
                backgroundColor: Colors.green.shade700.withOpacity(0.9),
              ).show(context);
            });
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return ExplorerPage(
                    Email: EmailForDB,
                    UID: UID,
                    // firstLocation: 'Select mode',
                    secondLocation: 'Select mode',
                    startTime: startTime,
                    endTime: endTime,
                    selectedIconIndex: -1,
                    endDestinationChoice: 0,
                    topK: 2,
                    topN: 2,
                    latStart: 0,
                    latEnd: 0,
                    longStart: 0,
                    longEnd: 0,
                    // dateandTime: "",
                  );
                },
              ),
            );
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to create post!"),
        ));
      }

    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  //This is to prepopulate textboxes for testing purposs
  void initState() {
    super.initState();
    email.text = "Johnny@gmail.com";
    password.text = "Johnny12345!";
    debugPrint("In login.dart");
  }

  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.selected,
        MaterialState.focused,
        MaterialState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red.shade800;
      }
      return Colors.red.shade800;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 105,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 220, top: 50),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 252),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: ' Email',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                    ),
                  ),
                  validator: (namevalue) {
                    if (namevalue!.trim().isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 220),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: ' Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                      child: Icon(
                        _secureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  obscureText: _secureText,
                  validator: (passwordvalue) {
                    if (passwordvalue!.trim().isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Checkbox(
                    //   activeColor: Colors.red.shade800,
                    //   fillColor: MaterialStateProperty.resolveWith(getColor),
                    //   value: isCheck,
                    //   onChanged: (bool? newBool) {
                    //     setState(() {
                    //       isCheck = newBool;
                    //     });
                    //   },
                    // ),
                    // Text(
                    //   'Remember Me?            ',
                    //   style: TextStyle(
                    //     color: Colors.red.shade600,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: RichText(
                        text: TextSpan(
                          text: 'Forget Password?',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return ServerForgetPassword(
                                      Email: email.text,
                                    );
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 155,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    connectAndPerformOperations();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 60),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ))),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // use text span to have multiple types of colors in a statement
              // or statement with different fonts sizes etc.
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const ServerRegisterPage();
                              },
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTopSnackBar1(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error',
        message:
            'Either Email or Password is incorrect. Please re-enter details.',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);
}
