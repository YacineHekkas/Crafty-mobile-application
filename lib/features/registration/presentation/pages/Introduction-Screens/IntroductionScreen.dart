import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/registration/presentation/pages/login/loginn.dart';
import 'package:cp_project/features/registration/presentation/widgets/splittext.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'SpliteTakeAction.dart';
import 'introPage_1.dart';
import 'introPage_2.dart';
import 'introPage_3.dart';

class introductionScreen extends StatefulWidget {
  const introductionScreen({Key? key}) : super(key: key);

  @override
  State<introductionScreen> createState() => _introductionScreenState();
}

class _introductionScreenState extends State<introductionScreen> {
  // this controller is here to keep trak of pages we have in pageView
  PageController _controller = PageController();
  // keep track of the lase Page
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                lastPage = (index == 3);
              });
            },
            controller: _controller,
            children: const [
              introPage1(),
              introPage2(),
              introPage3(),
              chooseS_P(),
            ],
          ),
          Container(
              //Skip Next and PageIndicator Container
              alignment: Alignment(0, 0.85),
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
                      : const SplitText(
                          text: 'OR',
                        ),
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
          Container(
            // continue as guest Container
            alignment: Alignment(0, 0.95),
            child: GestureDetector(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
                final app = locator<App>();

                if (app.getShowIntro() == null) {
                  await app.setShowIntro();
                }
              },
              child: Text(
                lastPage ? 'Login' : '',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      )),
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
