import 'package:flutter/material.dart';
import 'package:introduction_pages/homePage.dart';
import 'package:introduction_pages/intPages/intPage1.dart';
import 'package:introduction_pages/intPages/intPage2.dart';
import 'package:introduction_pages/intPages/intPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntPages extends StatefulWidget {
  const IntPages({Key? key}) : super(key: key);

  @override
  State<IntPages> createState() => _IntPagesState();
}

class _IntPagesState extends State<IntPages> {
  final PageController _controller = PageController();
// lastPage Variable
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            IntPage1(),
            IntPage2(),
            IntPage3(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SmoothPageIndicator(controller: _controller, count: 3),
            onLastPage
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    },
                    child: const Text('Done',
                        style: TextStyle(fontWeight: FontWeight.bold)))
                : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: const Text('Next',
                        style: TextStyle(fontWeight: FontWeight.bold)))
          ]),
        ),
      ]),
    );
  }
}
