import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/explorer.dart';
import 'package:project/pages/intro_pages/intro_page_1.dart';
import 'package:project/pages/intro_pages/intro_page_2.dart';
import 'package:project/pages/intro_pages/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPages extends StatefulWidget {
  String Email;

  String UID;

  IntroPages({
    Key? key,
    required this.UID,
    required this.Email,
  }) : super(key: key);

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  // controller to keep track of which page we are on
  final PageController _controller = PageController();

  //keep track of whether we on the last page
  bool onLastPage = false;

  TimeOfDay startTime = TimeOfDay.now();

  TimeOfDay endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
              ],
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                onLastPage
                    ? Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            // final qpython = FlutterQPython();

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ExplorerPage(
                                    Email: widget.Email,
                                    UID: widget.UID,
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
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 60),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Let's get started!",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(2);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
