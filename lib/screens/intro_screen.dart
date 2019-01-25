import 'package:flutter/material.dart';
import 'package:gift_organiser/anim/DotsIndicator.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final _controller = PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  List<Widget> _pages = [];

  var thirdPageReached = false;

  @override
  void initState() {
    _pages = <Widget>[
      Container(
        color: Colors.red[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Collect ideas",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.red[100],
                      fontWeight: FontWeight.bold),
                )),
            Image.asset(
              'assets/images/present.png',
              width: 200,
              color: Colors.white,
              height: 200,
            ),
            Padding(
              child: Text(
                "Think about present you want get",
                style: TextStyle(fontSize: 18, color: Colors.red[50]),
              ),
              padding: EdgeInsets.all(20),
            )
          ],
        ),
      ),
      Container(
        color: Colors.blue[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Share",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.blue[50],
                      fontWeight: FontWeight.bold),
                )),
            Image.asset(
              'assets/images/share.png',
              width: 200,
              color: Colors.white,
              height: 200,
            ),
            Padding(
              child: Text(
                "Think about present you want get",
                style: TextStyle(fontSize: 18, color: Colors.blue[50]),
              ),
              padding: EdgeInsets.all(20),
            )
          ],
        ),
      ),
      Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Gain profit",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold),
                )),
            Image.asset(
              'assets/images/happy.png',
              width: 200,
              height: 200,
            ),
            Padding(
              child: Text(
                "Have your gift organised!",
                style: TextStyle(fontSize: 18, color: Colors.grey[900]),
              ),
              padding: EdgeInsets.all(20),
            )
          ],
        ),
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        new PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
          itemCount: _pages.length,
          onPageChanged: showNextButton,
        ),
        new Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: new Container(
            color: Colors.grey[800].withOpacity(0.5),
            padding: const EdgeInsets.all(20.0),
            child: new Center(
              child: new DotsIndicator(
                controller: _controller,
                itemCount: _pages.length,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page % _pages.length,
                    duration: _kDuration,
                    curve: _kCurve,
                  );
                },
              ),
            ),
          ),
        ),
        new Positioned(
            bottom: 50,
            right: 0,
            left: 0,
            child: Visibility(
                visible: thirdPageReached,
                child: MaterialButton(
                  height: 50,
                  color: Colors.white,
                  onPressed: goToLogin,
                  child: Text(
                    "Let's go",
                    style: TextStyle(fontSize: 16),
                  ),
                )))
      ],
    ));
  }

  void showNextButton(int position) {
    if (position == 2) {
      setState(() {
        thirdPageReached = true;
      });
    }
  }

  void goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
