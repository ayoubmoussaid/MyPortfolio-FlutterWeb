import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:portfolio/components/customButton.dart';
import 'package:portfolio/constants.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  AnimationController _animationButtonController;
  ScrollController listController;
  double _height = 155.0;
  bool showButton;

  @override
  void initState() {
    showButton = false;
    listController = ScrollController(initialScrollOffset: 0.0);
    listController.addListener(() {
      if (listController.offset == 0) {
        _height = 155.0;
        showButton = false;
      } else {
        _height = 55.0;
        showButton = true;
      }
      setState(() {});
    });

    _animationButtonController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450))
          ..addListener(() {
            setState(() {});
          })
          ..forward()
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationButtonController.dispose();
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* SizedBox(
          height: 55.0,
        ), */
        AnimatedContainer(
          color: _height == 55 ? Colors.white : Colors.transparent,
          duration: Duration(milliseconds: 300),
          height: _height,
        ),
        Expanded(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))),
            child: Stack(
              children: [
                ListView(
                  controller: listController,
                  padding: EdgeInsets.only(
                    top: 100.0,
                    left: 60.0,
                  ),
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 140,
                          height: 140,
                          child: Image(
                            image: AssetImage('assets/profile.jpeg'),
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 180,
                      child: TypewriterAnimatedTextKit(
                          speed: Duration(milliseconds: 150),
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [whoami],
                          textStyle: TextStyle(fontSize: 35.0, color: Colors.black),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                          ),
                    ),
                    /* Row(
                      children: [
                        Text(whoami,
                            style: TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Text(
                                '|',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ), */
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      'ABOUT',
                      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      about,
                      style: TextStyle(color: Colors.grey.shade800, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
                //scroll bar
                AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: showButton ? 1.0 : 0.0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: AnimatedBuilder(
                      animation: _animationButtonController,
                      builder: (context, child) => Transform(
                        transform: Matrix4.identity()
                          ..translate(0, _animationButtonController.value * -3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: child,
                        ),
                      ),
                      child: CustomButton(
                        height: 50.0,
                        width: 50.0,
                        radius: 50.0 / 2,
                        backgroundColor: Theme.of(context).textTheme.headline1.color,
                        splashColor: Theme.of(context).accentColor,
                        childColor: Colors.white,
                        start: false,
                        onTap: () {
                          listController.animateTo(0,
                              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                        iconData: Icons.keyboard_arrow_up,
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: showButton ? 0.0 : 1.0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedBuilder(
                      animation: _animationButtonController,
                      builder: (context, child) => Transform(
                        transform: Matrix4.identity()
                          ..translate(0, _animationButtonController.value * -3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: child,
                        ),
                      ),
                      child: CustomButton(
                        height: 50.0,
                        width: 50.0,
                        radius: 50.0 / 2,
                        backgroundColor: Theme.of(context).textTheme.headline1.color,
                        splashColor: Theme.of(context).accentColor,
                        childColor: Colors.white,
                        start: false,
                        onTap: () {
                          listController.animateTo(listController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                        iconData: Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
