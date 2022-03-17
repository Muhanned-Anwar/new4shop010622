import 'package:flutter/material.dart';
import 'package:new4shop010622/prefs/customer_preference_controller.dart';
import 'package:new4shop010622/prefs/user_prefernce_controller.dart';

import '../Widgets/page_view_indicator.dart';
import 'out_boarding_content.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    CustomerPreferenceController().saveFirstOpenApp();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
            visible: _currentPageIndex != 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.slowMiddle);
                });
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int value) {
                setState(() {
                  _currentPageIndex = value;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                OutBoardingContent(
                  title: 'Title One',
                  body: 'Quia sed consequatur rem quia molestias nulla quia. '
                      'Eos optio soluta asperiores in similique. Eius tenetur blanditiis '
                      'ad cumque aspernatur earum nihil qui. Eveniet doloribus cum eum '
                      'rerum facilis aut. Et quos dolores eos sed ex voluptatem dolorem est ut. '
                      'Alias voluptatum dolorem occaecati cum atque in dolorum sequi qui.',
                  image: Image.asset('images/out_boarding_screen/img1.png'),
                ),
                OutBoardingContent(
                  title: 'Title One',
                  body: 'Quia sed consequatur rem quia molestias nulla quia. '
                      'Eos optio soluta asperiores in similique. Eius tenetur blanditiis '
                      'ad cumque aspernatur earum nihil qui. Eveniet doloribus cum eum '
                      'rerum facilis aut. Et quos dolores eos sed ex voluptatem dolorem est ut. '
                      'Alias voluptatum dolorem occaecati cum atque in dolorum sequi qui.',
                  image: Image.asset('images/out_boarding_screen/img2.png'),
                ),
                OutBoardingContent(
                  title: 'Title One',
                  body: 'Quia sed consequatur rem quia molestias nulla quia. '
                      'Eos optio soluta asperiores in similique. Eius tenetur blanditiis '
                      'ad cumque aspernatur earum nihil qui. Eveniet doloribus cum eum '
                      'rerum facilis aut. Et quos dolores eos sed ex voluptatem dolorem est ut. '
                      'Alias voluptatum dolorem occaecati cum atque in dolorum sequi qui.',
                  image: Image.asset('images/out_boarding_screen/img3.png'),
                ),
                OutBoardingContent(
                  title: 'Title One',
                  body: 'Quia sed consequatur rem quia molestias nulla quia. '
                      'Eos optio soluta asperiores in similique. Eius tenetur blanditiis '
                      'ad cumque aspernatur earum nihil qui. Eveniet doloribus cum eum '
                      'rerum facilis aut. Et quos dolores eos sed ex voluptatem dolorem est ut. '
                      'Alias voluptatum dolorem occaecati cum atque in dolorum sequi qui.',
                  image: Image.asset('images/out_boarding_screen/img4.png'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 0, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PageViewIndicator(
                          selected: _currentPageIndex == 0, marginEnd: 8),
                      PageViewIndicator(
                          selected: _currentPageIndex == 1, marginEnd: 8),
                      PageViewIndicator(
                        selected: _currentPageIndex == 2,
                        marginEnd: 8,
                      ),
                      PageViewIndicator(
                        selected: _currentPageIndex == 3,
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                      // top: 40,
                      // bottom: 70,
                      start: 56,
                      end: 61,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/authentication_screen');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Spacer(flex: 4),
                          Text(
                            'Start',
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(flex: 1),
                          SizedBox(width: 25),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.arrow_forward_outlined),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        minimumSize: const Size(200, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
