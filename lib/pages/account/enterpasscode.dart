// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:project/pages/account/forgetpassword.dart';
// import 'package:project/pages/account/newpassword.dart';

// class EnterPasscode extends StatefulWidget {
//   const EnterPasscode({super.key});

//   @override
//   State<EnterPasscode> createState() => _EnterPasscodeState();
// }

// class _EnterPasscodeState extends State<EnterPasscode> {
//   TextEditingController firstDigit = TextEditingController();

//   TextEditingController secondDigit = TextEditingController();

//   TextEditingController thirdDigit = TextEditingController();

//   TextEditingController fourthDigit = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 105,
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(right: 90, top: 45),
//                 child: Text(
//                   'Forget Password',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 40,
//                   right: 90,
//                 ),
//                 child: Text(
//                   'Verification code has been sent to your email. Please check your email.',
//                   style: TextStyle(
//                     color: Colors.grey.shade500,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 11,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50),
//               Padding(
//                 padding: const EdgeInsets.only(left: 30, right: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       height: 90,
//                       width: 70,
//                       child: TextFormField(
//                         onChanged: (value) {
//                           if(value.length == 1){
//                             FocusScope.of(context).nextFocus();
//                           }
//                         },
//                         controller: firstDigit,
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                           hintStyle: TextStyle(
//                             color: Colors.grey.shade400,
//                             fontSize: 15,
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.trim().isEmpty) {
//                             return 'Field is\nrequired';
//                           }
//                           return null;
//                         },
//                         textAlign: TextAlign.center,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 90,
//                       width: 70,
//                       child: TextFormField(
//                          onChanged: (value) {
//                           if(value.length == 1){
//                             FocusScope.of(context).nextFocus();
//                           }
//                         },
//                         controller: secondDigit,
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                           hintStyle: TextStyle(
//                             color: Colors.grey.shade400,
//                             fontSize: 15,
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.trim().isEmpty) {
//                             return 'Field is\nrequired';
//                           }
//                           return null;
//                         },
//                         textAlign: TextAlign.center,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 90,
//                       width: 70,
//                       child: TextFormField(
//                          onChanged: (value) {
//                           if(value.length == 1){
//                             FocusScope.of(context).nextFocus();
//                           }
//                         },
//                         controller: thirdDigit,
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                           hintStyle: TextStyle(
//                             color: Colors.grey.shade400,
//                             fontSize: 15,
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.trim().isEmpty) {
//                             return 'Field is\nrequired';
//                           }
//                           return null;
//                         },
//                         textAlign: TextAlign.center,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 90,
//                       width: 70,
//                       child: TextFormField(
//                         controller: fourthDigit,
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                           hintStyle: TextStyle(
//                             color: Colors.grey.shade400,
//                             fontSize: 15,
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.trim().isEmpty) {
//                             return 'Field is\nrequired';
//                           }
//                           return null;
//                         },
//                         textAlign: TextAlign.center,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 100),
//                 child: RichText(
//                   text: TextSpan(
//                     children: <TextSpan>[
//                       const TextSpan(
//                         text: 'Never receive the code? ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 13,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Resend',
//                         style: const TextStyle(
//                           color: Colors.red,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 13,
//                           decoration: TextDecoration.underline,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             showTopSnackBar1(context);
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 171,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     if (firstDigit.text == '1' &&
//                         secondDigit.text == '2' &&
//                         thirdDigit.text == '3' &&
//                         fourthDigit.text == '4') {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (BuildContext context) {
//                             return const NewPassword();
//                           },
//                         ),
//                       );
//                     } else {
//                       showTopSnackBar2(context);
//                     }
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size(300, 60),
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                       Radius.circular(30),
//                     ))),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return const ForgetPassword();
//                       },
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.black,
//                     minimumSize: const Size(300, 60),
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                       Radius.circular(30),
//                     ))),
//                 child: const Text(
//                   'Go Back',
//                   style: TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showTopSnackBar1(BuildContext context) => Flushbar(
//         icon: const Icon(
//           Icons.message,
//           size: 32,
//           color: Colors.white,
//         ),
//         shouldIconPulse: false,
//         padding: const EdgeInsets.all(24),
//         title: 'Code verfication',
//         message: 'The 4-digit code is 1234',
//         flushbarPosition: FlushbarPosition.TOP,
//         margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(10),
//         ),
//         duration: const Duration(seconds: 3),
//         barBlur: 20,
//         backgroundColor: Colors.black.withOpacity(0.7),
//       )..show(context);

//   void showTopSnackBar2(BuildContext context) => Flushbar(
//         icon: const Icon(
//           Icons.error,
//           size: 32,
//           color: Colors.white,
//         ),
//         shouldIconPulse: false,
//         padding: const EdgeInsets.all(24),
//         title: 'Error',
//         message: 'Wrong 4-digit code has been entered. Please retry',
//         flushbarPosition: FlushbarPosition.TOP,
//         margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(10),
//         ),
//         duration: const Duration(seconds: 3),
//         barBlur: 20,
//         backgroundColor: Colors.black.withOpacity(0.7),
//       )..show(context);
// }
