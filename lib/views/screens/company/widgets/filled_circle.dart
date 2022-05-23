import 'package:flutter/material.dart';

class FilledCircle extends StatelessWidget {
  final String text;
  final Color color;
  final bool filled;

  const FilledCircle({this.text = "", this.color = Colors.white, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? color : Colors.transparent,
        border: Border.all(color: color, width: 4.0),
      ),
      alignment: Alignment.center,
      child: Text(text, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
