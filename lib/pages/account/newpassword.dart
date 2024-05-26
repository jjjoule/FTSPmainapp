import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/account/forgetpassword.dart';
import 'package:flutter/scheduler.dart';
import 'package:crypt/crypt.dart';
import 'package:postgres/postgres.dart';

import 'login.dart';

class NewPassword extends StatefulWidget {
  String Email;

  NewPassword({
    Key? key,
    required this.Email,
  }) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  void initState() {
    super.initState();
    debugPrint("In newpassword.dart");
  }

  bool _secureText1 = true;

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

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

      // print(widget.Email);

      String PasswordForDB = password.text;
      Crypt HashedPassword =
          Crypt.sha256(PasswordForDB, salt: 'abcdefghijklmnop');
      // Read a row
      final selectResult = await connection.query(
          "SELECT password FROM public.userprofile where email = '${widget.Email}'");
      for (final row in selectResult) {
        if ("[$HashedPassword]" == row.toString()) {
          showTopSnackBar1(context);
        } else {
          final updatequery = await connection.execute(
              "UPDATE public.userprofile set password = '$HashedPassword'");
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
              message: 'Password has been updated successfully',
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
                return const LoginPage();
              },
            ),
          );
          debugPrint('row has been updated');
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 110,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 100, top: 45),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 91,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 180),
                child: Text(
                  'New Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
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
                          _secureText1 = !_secureText1;
                        });
                      },
                      child: Icon(
                        _secureText1 ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  obscureText: _secureText1,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Password is required';
                    }
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Please enter a stronger password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 156),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
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
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: ' Re-enter Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (password.text != confirmPassword.text) {
                      return 'The 2 passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 93,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    connectAndPerformOperations();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ForgetPassword(
                          Email: widget.Email,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(300, 60),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ))),
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                    fontSize: 17,
                  ),
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
            'New password entered cannot be the same as the current password.',
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
