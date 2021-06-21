import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Screens/SignPages/signInPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  void goToNextPage(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward().whenComplete(() => goToNextPage(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SharedText.screenHeight,
        width: SharedText.screenWidth,
        color: Colors.white,
        child: customWidget(),
      ),
    );
  }

  Widget customWidget() {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: SharedText.screenHeight,
            width: SharedText.screenWidth,
            color: Colors.white,
            child: Center(
              child: Image.asset('images/logo.png',
                  fit: BoxFit.contain,
                  height: SharedText.screenHeight * 0.35,
                  width: SharedText.screenHeight * 0.35),
            ),
          ),
        ),
      ),
    );
  }
}
