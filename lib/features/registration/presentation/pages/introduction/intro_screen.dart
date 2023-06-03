import 'package:auto_route/annotations.dart';
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_final_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_first_page.dart';
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_second_page.dart';
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_third_page.dart';

@RoutePage()
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  final _controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (index) {
                    setState(() {
                      lastPage = (index == 3);
                    });
                  },
                  controller: _controller,
                  children: const [
                    IntroFirstPage(),
                    IntroSecondPage(),
                    IntroThirdPage(),
                    IntroFinalPage(),
                  ],
                ),
                Container(
                  //Skip Next and PageIndicator Container
                    alignment: const Alignment(0, 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(3);
                          },
                          child: Text(
                            lastPage ? '' : 'Skip',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        !lastPage
                            ? buildsmoothPageIndicator()
                            :  const SizedBox(),
                        GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 120),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            lastPage ? '' : 'Next',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )),

              ],
            ),
    ),
    );
  }

  SmoothPageIndicator buildsmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: _controller,
      count: 4,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.black,
        dotColor: Colors.grey,
      ),
    );
  }
}
