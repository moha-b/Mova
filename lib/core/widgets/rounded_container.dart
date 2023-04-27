import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double radius;
  final double horizontal;
  final double vertical;
  final double? width;
  final double? height;
  final Widget child;
  final Color? color;

  const RoundedContainer({
    Key? key,
    required this.radius,
    this.horizontal = 0.0,
    this.vertical = 0.0,
    this.width,
    this.color,
    this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          width: 2.0,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
      child: child,
    );
  }
}
