import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  final Widget child;
  const Tags({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4)
      ),
      child: child,
    );
  }
}