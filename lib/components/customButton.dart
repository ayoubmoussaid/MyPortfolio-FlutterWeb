import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData iconData;
  final double height;
  final double width;
  final Function onTap;
  final double radius;
  final Color backgroundColor;
  final Color splashColor;
  final Color childColor;
  final bool start;

  const CustomButton({
    Key key,
    this.height,
    this.width,
    this.radius,
    this.backgroundColor,
    this.splashColor,
    this.childColor,
    this.start,
    this.onTap,
    this.text,
    this.iconData,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool hover;

  @override
  void initState() {
    hover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          child: Stack(
            children: [
              Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    color: widget.backgroundColor),
              ),
              Align(
                alignment: widget.start ? Alignment.centerLeft : Alignment.center,
                child: AnimatedContainer(
                  width: hover ? widget.width : 0,
                  decoration: BoxDecoration(
                      color: widget.splashColor,
                      borderRadius: BorderRadius.circular(widget.radius)),
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: widget.text == null
                      ? Icon(
                          widget.iconData,
                          color: widget.childColor,
                          size: 30.0,
                        )
                      : Text(
                          widget.text,
                          style:
                              TextStyle(color: hover ? widget.backgroundColor : widget.childColor),
                        ) //widget.child,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
