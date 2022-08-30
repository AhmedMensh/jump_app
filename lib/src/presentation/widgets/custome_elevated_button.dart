import 'package:flutter/material.dart';
import 'package:jumpapp/src/config/size_config/size_config.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final void Function() action;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final double? borderRadius;
  final double labelFontSize;
  final FontWeight fontWeight;

  const CustomButton(
      {Key? key,
      required this.action,
      this.label,
      this.labelFontSize = 16,
      this.borderRadius,
      this.backgroundColor,
      this.textColor,
      this.fontWeight = FontWeight.w600,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation ?? 0.5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)))),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? Colors.blue),
        minimumSize: MaterialStateProperty.all<Size>(Size(
            SizeConfig.screenWidth! * 0.92, SizeConfig.screenHeight! * 0.07)),
      ),
      onPressed: action,
      child: Text(
        label ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: labelFontSize,
          color: textColor,
          fontWeight: fontWeight
        ),
      ),
    );
  }
}
