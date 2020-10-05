import 'package:flutter/material.dart';

class ServiceWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;
  final Color fadedColor;
  final String text;
  final TextStyle textStyle;

  const ServiceWidget(
      {Key key, this.icon, this.size, this.color, this.text, this.textStyle, this.fadedColor})
      : super(key: key);

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> with SingleTickerProviderStateMixin {
  bool _hover;
  AnimationController _controller;

  @override
  void initState() {
    _hover = false;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _hover = true;
          });
          _controller.forward();
        },
        onExit: (event) {
          setState(() {
            _hover = false;
          });
          _controller.reset();
        },
        child: Container(
          height: 200.0,
          width: 200.0,
          //color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
                child: Icon(
                  widget.icon,
                  color: _hover ? widget.color : widget.fadedColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ), //widget.icon,
              Text(
                widget.text,
                style: TextStyle(fontSize: 20.0, color: _hover ? widget.color : widget.fadedColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
