import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internshala_assignment/views/courses_page.dart';
import 'package:internshala_assignment/views/homepage.dart';
import 'package:internshala_assignment/views/internship_page.dart';
import 'package:internshala_assignment/views/jobs_page.dart';

class NavigationItem {
  final IconData icon;
  final String label;

  const NavigationItem({
    required this.icon,
    required this.label,
  });
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  static const _navbarWidgets = [
    Homepage(),
    InternshipPage(),
    JobsPage(),
    CoursesPage()
  ];

  static const List<NavigationItem> items = [
    NavigationItem(icon: FontAwesomeIcons.house, label: 'Home'),
    NavigationItem(icon: FontAwesomeIcons.paperPlane, label: 'Internships'),
    NavigationItem(icon: FontAwesomeIcons.briefcase, label: 'Jobs'),
    NavigationItem(icon: FontAwesomeIcons.video, label: 'Courses'),
  ];

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  void onItemTapped (int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Navigation._navbarWidgets.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        showSelectedLabels: true,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurple),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        iconSize: 24,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: Navigation.items
            .map((item) => BottomNavigationBarItem(
                  icon: FaIcon(item.icon),
                  label: item.label,
                ))
            .toList(),
    ));
  }
}