import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'customButton.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool hover;
  @override
  void initState() {
    hover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.grey,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Text('MOUSSAID AYOUB'),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0, top: 10.0, bottom: 10.0),
          child: CustomButton(
            text: 'DOWNLOAD RESUME',
            height: 50.0,
            width: 150,
            radius: 3.0,
            backgroundColor: Theme.of(context).backgroundColor,
            splashColor: Theme.of(context).accentColor,
            childColor: Theme.of(context).textTheme.headline1.color,
            start: true,
            onTap: () {
              print('download resume');
            },
          ),
        ),
      ],
    );
  }
}

/* MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              setState(() {
                hover = true;
              });
            },
            onExit: (event) {
              setState(() {
                hover = false;
              });
            },
            child: GestureDetector(
              onTap: () {
                print('download resume');
              },
              child: Container(
                alignment: Alignment.center,
                width: 150.0,
                child: Stack(
                  children: [
                    Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        width: hover ? 150.0 : 0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(3.0)),
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'DOWNLOAD RESUME',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ), */
