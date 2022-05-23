import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final Color color;
  final bool filled;

  const CustomCircle({this.color = Colors.white, this.filled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? color : Colors.transparent,
        border: Border.all(color: color, width: 2.0),
      ),
    );
  }
}
