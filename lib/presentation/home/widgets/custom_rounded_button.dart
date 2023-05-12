import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool border;
  final double? width;
  final double? height;
  const CustomIconButton({
    super.key,
    required this.text,
    this.icon,
    required this.border,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 90,
      height: height ?? 35,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: border == false
          ? buildFilledBoxDecoration(context: context)
          : buildOutlinedBoxDecoration(context: context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIcon(icon: icon),
          buildText(context: context, text: text),
        ],
      ),
    );
  }

  Text buildText({required BuildContext context, required String text}) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
    );
  }

  Icon buildIcon({IconData? icon, double? size, Color? color}) {
    return Icon(
      icon ?? Icons.play_circle_rounded,
      size: size ?? 18,
      color: color ?? Colors.white,
    );
  }

  BoxDecoration buildFilledBoxDecoration(
      {required BuildContext context, double? radius, Color? color}) {
    return BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(radius ?? 25),
    );
  }

  BoxDecoration buildOutlinedBoxDecoration(
      {required BuildContext context, double? radius}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 25),
        border: Border.all(width: 3, color: Colors.white));
  }
}
