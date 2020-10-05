import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListElement extends StatefulWidget {
  final String title;
  final bool selected;

  const ListElement({Key key, this.title, this.selected}) : super(key: key);
  @override
  _ListElementState createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  bool _visible;

  @override
  void initState() {
    super.initState();
    //print('i just want to live');
    _visible = widget.selected;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    offset = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    if (widget.selected) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              if (!widget.selected) {
                setState(() {
                  _visible = true;
                });
                controller.forward();
              }
              print('enterd');
            },
            onExit: (event) {
              if (!widget.selected) {
                setState(() {
                  _visible = false;
                });
                controller.reverse();
              }
              print('exited');
            },
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.selected ? Colors.transparent : Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          SlideTransition(
            position: offset,
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Text(
                widget.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
