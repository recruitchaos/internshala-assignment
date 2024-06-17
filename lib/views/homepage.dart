import 'package:flutter/material.dart';
import 'package:internshala_assignment/common/custom_app_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Internshala"), leading: Icon(Icons.menu)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Make your dream career", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text("a reality", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}