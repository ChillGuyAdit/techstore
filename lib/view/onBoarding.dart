import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:techstore/helper/color.dart';
import 'package:techstore/page/homePage.dart';
import 'package:techstore/view/page_one.dart';
import 'package:techstore/view/page_three.dart';
import 'package:techstore/view/page_two.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: ClampingScrollPhysics(),
            controller: _controller,
            children: [PageOne(), PageTwo(), PageThree()],
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // alignment: Alignment(0, 0.9),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 18,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 10),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: onLastPage
                      ? ElevatedButton(
                          child: Text(
                            'Selesai',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              color: AppColor().hitam,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.37,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              254,
                              254,
                            ).withOpacity(0.5),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
                        )
                      : SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                key: _globalKey,
                                child: Text(
                                  'Lanjut',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 25,
                                    color: AppColor().putih,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.38,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor: AppColor().hitam,
                                ),
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                child: Text(
                                  'Lewati',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 25,
                                    color: AppColor().hitam,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.38,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor: AppColor().putih,
                                ),
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
