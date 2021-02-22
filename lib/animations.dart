import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    // it flying from left side towards center
    // -ve value mean it start from left side
    animation = Tween(begin: 0.0, end: -0.15).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 350.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Live'),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Details'),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      animationController.forward();
                    },
                    onDoubleTap: () {
                      animationController.reverse();
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 350.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage('images/Makkah.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      transform: Matrix4.translationValues(
                          0.0, animation.value * width, 0.0),
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
