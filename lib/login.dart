import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation animation, transformationAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    // it flying from left side towards center
    // -ve value mean it start from left side
    animation = Tween(begin: 10.0, end: 200.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));

    transformationAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(150.0),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: animation.value * 2,
                    height: animation.value * 2,
                    decoration: BoxDecoration(
                      borderRadius: transformationAnimation.value,
                      image: DecorationImage(
                        image: AssetImage('images/Makkah.jpg'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
