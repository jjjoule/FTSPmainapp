import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/main/profile.dart';

import '../account/newpassword2.dart';

class SettingsPage extends StatefulWidget {
  String Email;

  String UID;

  SettingsPage({
    Key? key,
    required this.UID,
    required this.Email,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      // body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 300),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ProfilePage(
                        Email: widget.Email,
                        UID: widget.UID,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 200.0,
              top: 80,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.red.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.public,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'App Language                            ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     Navigator.of(context).pushReplacement(
                          //       MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //           return const LandingPage();
                          //         },
                          //       ),
                          //     );
                          //   },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey.shade700,
                        size: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 45),
                Row(
                  children: [
                    Icon(
                      Icons.color_lens,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Theme                                         ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     Navigator.of(context).pushReplacement(
                          //       MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //           return const LandingPage();
                          //         },
                          //       ),
                          //     );
                          //   },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey.shade700,
                        size: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 45),
                Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'History                                        ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     Navigator.of(context).pushReplacement(
                          //       MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //           return const LandingPage();
                          //         },
                          //       ),
                          //     );
                          //   },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey.shade700,
                        size: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 45),
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Notifications                              ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     Navigator.of(context).pushReplacement(
                          //       MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //           return const LandingPage();
                          //         },
                          //       ),
                          //     );
                          //   },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey.shade700,
                        size: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 45),
                Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Change Password                    ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return NewPassword2(
                                      Email: widget.Email,
                                      UID: widget.UID,
                                    );
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey.shade700,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
