import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:internshala_assignment/common/custom_app_bar.dart';
import 'package:internshala_assignment/constants/sceeen_dimensions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Internshala"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
                child: Image(
              image: AssetImage('assets/images/internshala.png'),
              width: ScreenDimension.getScreenWidth(context) * 0.3,
              height: ScreenDimension.getScreenWidth(context) * 0.3,
            )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Make your dream career",
              style: TextStyle(
                  fontSize: ScreenDimension.getScreenWidth(context) * 0.074,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "a reality",
              style: TextStyle(
                  fontSize: ScreenDimension.getScreenWidth(context) * 0.074,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                autoPlayInterval: 3000,
                isLoop: true,
                indicatorBackgroundColor: Colors.grey,
                children: [
                  Image.asset(
                    'assets/images/banner_image1.png',
                    width: ScreenDimension.getScreenWidth(context),
                  ),
                  Image.asset('assets/images/banner_image2.png'),
                  Image.asset('assets/images/banner_image3.png'),
                ])
          ],
        ),
      ),
    );
  }
}
