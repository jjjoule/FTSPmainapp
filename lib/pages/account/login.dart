import 'package:another_flushbar/flushbar.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project/pages/account/forgetpassword.dart';
import 'package:project/pages/account/register.dart';
import 'package:postgres/postgres.dart';

import '../main/explorer/explorer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;

  bool? isCheck = false;

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  String namevalue = '';

  String passwordvalue = '';

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final String _errorMessage = '';

  TimeOfDay startTime = TimeOfDay.now();

  TimeOfDay endTime = TimeOfDay.now();
  final formKey = GlobalKey<FormState>();

  Future<void> connectAndPerformOperations() async {
    final connection = PostgreSQLConnection(
      '10.0.2.2',
      5432,
      'postgres',
      username: 'postgres',
      password: 'postgres',
    );

    try {
      await connection.open();

      String EmailForDB = email.text;
      String PasswordForDB = password.text;
      Crypt HashedPassword =
          Crypt.sha256(PasswordForDB, salt: 'abcdefghijklmnop');
      // Read a row
      final selectResult = await connection.query(
          "SELECT EXISTS (SELECT * FROM public.userprofile where email='$EmailForDB' and password = '$HashedPassword')");
      for (final row in selectResult) {
        if (row.toString() == "[false]") {
          showTopSnackBar1(context);
          password.clear();
        } else if (row.toString() == "[true]") {
          final selectResult = await connection.query(
              '''SELECT "User ID" from public.userprofile where "email" = '$EmailForDB' ''');
          for (final row in selectResult) {
            String UID = row.toString().replaceAll(RegExp('[^A-Za-z0-9]'), '');
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Flushbar(
                icon: const Icon(
                  Icons.message,
                  size: 32,
                  color: Colors.white,
                ),
                shouldIconPulse: false,
                padding: const EdgeInsets.all(24),
                title: 'Success Message',
                message: 'Login successful',
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
                    // firstLocation: 'Search destination',
                    secondLocation: 'Search destination',
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
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      await connection.close();
    }
  }

  @override
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
                                    return ForgetPassword(
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
                                return const RegisterPage();
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
        title: 'Error message',
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
