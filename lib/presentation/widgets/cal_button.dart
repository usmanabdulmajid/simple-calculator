import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalButton extends StatefulWidget {
  final String buttonText;

  const CalButton({Key key, this.buttonText}) : super(key: key);
  @override
  _CalButtonState createState() => _CalButtonState();
}

class _CalButtonState extends State<CalButton>
    with SingleTickerProviderStateMixin {
  AnimationController _buttonController;

  @override
  void initState() {
    _buttonController = AnimationController(
        vsync: this, upperBound: 0.1, duration: Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (v) {
        print(_buttonController.value);
        _buttonController.forward();
        print('kk');
      },
      onTapUp: (v) {
        print(_buttonController.value);
        _buttonController.reverse();
      },
      child: Transform.scale(
        scale: 1.0 - _buttonController.value,
        child: Container(
          //alignment: Alignment.center,
          margin: EdgeInsets.all(5.0),
          height: _size.width * 0.20,
          width: _size.width * 0.20,
          child: Neumorphic(
            style: NeumorphicStyle(
              //intensity: 0.5,
              surfaceIntensity: 1,
              depth: 8,
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                widget.buttonText,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
