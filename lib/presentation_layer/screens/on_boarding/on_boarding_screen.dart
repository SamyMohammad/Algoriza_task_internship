import 'package:algoriza_task1/presentation_layer/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'on_boarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  bool isLast = false;
  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: Colors.deepOrangeAccent),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (value) => setState(() {
                      _currentPage = value;
                      if (value == contents.length - 1) {
                        isLast = true;
                        setState(() {});
                      } else {
                        isLast = false;
                        setState(() {});
                      }
                    }),
                    itemCount: contents.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding:const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
                        child: Column(
                          children: [
                            Image.asset(
                              contents[i].image,
                              height: SizeConfig.blockV! * 35,
                            ),
                            SizedBox(
                              height: (height >= 840) ? 60 : 15,
                            ),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                fontSize: (width <= 550) ? 30 : 35,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              contents[i].desc,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w300,
                                fontSize: (width <= 550) ? 17 : 25,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (int index) => _buildDots(index: index),
                        ),
                      ),
                     ElevatedButton(
                       onPressed: () {
                         Navigator.pushReplacementNamed(
                             context, LoginScreen.routeName);
                       },
                       style: ElevatedButton.styleFrom(
                         primary: Theme.of(context).primaryColor,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50),
                         ),
                         padding: (width <= 550)
                             ? const EdgeInsets.symmetric(
                                 horizontal: 100, vertical: 20)
                             : EdgeInsets.symmetric(
                                 horizontal: width * 0.2, vertical: 25),
                         textStyle: TextStyle(
                             fontSize: (width <= 550) ? 13 : 17),
                       ),
                       child: const Text("Get Started"),
                     ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have an Account ? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text("Sign Up ",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
