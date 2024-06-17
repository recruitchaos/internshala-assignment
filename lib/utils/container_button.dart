import 'package:flutter/material.dart';
import 'package:internshala_assignment/constants/sceeen_dimensions.dart';

class ContainerButton extends StatelessWidget {
  final String text; final Color backgroundColor; final EdgeInsets padding; final TextStyle? textStyle; final VoidCallback? onPressed;
  const ContainerButton({super.key, required this.text, required this.backgroundColor, required this.padding, this.textStyle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xff008BDC), width: 2),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}