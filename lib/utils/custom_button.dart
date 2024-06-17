import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.5, color: Color(0xff008BDC))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: [
              Icon(Iconsax.filter_outline, size: 20, color: Color(0xff008BDC),),
              Text(" Filters", style: TextStyle(color: Color(0xff008BDC), fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ),
    );
  }
}