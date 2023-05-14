import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? borderRadius;
  final Color? iconColor;
  final Color? textColor;
  final bool iconButton;
  final bool border;
  final IconData? icon;

  const BuildButton({
    Key? key,
    required this.text,
    this.icon,
    this.width,
    this.height,
    this.paddingHorizontal,
    this.paddingVertical,
    required this.iconButton,
    required this.border,
    this.borderRadius,
    this.marginHorizontal,
    this.marginVertical,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? 0, vertical: marginVertical ?? 0),
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? 8, vertical: paddingVertical ?? 4),
      decoration: border
          ? buildOutlinedBoxDecoration(context: context, radius: borderRadius)
          : buildFilledBoxDecoration(context: context, radius: borderRadius),
      child: iconButton
          ? buildIconButton(
              context: context,
              text: text,
              textColor: textColor,
              icon: icon ?? Icons.play_circle_fill_rounded,
              iconColor: iconColor,
            )
          : buildText(context: context, text: text, color: textColor),
    );
  }

  Text buildText({required context, required String text, Color? color}) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }

  Row buildIconButton({
    required BuildContext context,
    required String text,
    Color? textColor,
    Color? iconColor,
    required IconData icon,
    double? size,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: size,
          color: iconColor ?? Colors.white,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor ?? Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  BoxDecoration buildFilledBoxDecoration(
      {required BuildContext context, double? radius, Color? color}) {
    return BoxDecoration(
      color: color ?? Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(radius ?? 25),
    );
  }

  BoxDecoration buildOutlinedBoxDecoration(
      {required BuildContext context, double? radius}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 25),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.7,
        ));
  }
}
