import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class AppButton extends StatelessWidget {

  final String buttonText;
  final VoidCallback voidCallback;
  final bool enabled;
  final Color enabledColor;
  final Color textColor;
  final double? width;
  final double? height;
  final Color? borderColor;

  const AppButton({super.key, required this.buttonText, required this.voidCallback, required this.enabled, required this.enabledColor, required this.textColor, this.width, this.height, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width ?? 200.0,
      height: height ?? 80.0,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: borderColor ?? Colors.transparent)),
            backgroundColor: MaterialStateProperty.all<Color>(enabled ? enabledColor : enabledColor.withOpacity(0.5)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 16, horizontal: 28)),
            shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)
            ),
            ),
          ),
          onPressed: enabled ? voidCallback : null,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: textColor,
              // letterSpacing: 0.88,
            ).apply(fontWeightDelta: 1),
          )
      ),
    );
  }
}
