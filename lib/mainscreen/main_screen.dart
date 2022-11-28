// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projectx/tabpages/about_page.dart';
import 'package:projectx/tabpages/home_pages.dart';
import 'package:projectx/tabpages/tflite_page.dart';
import 'package:projectx/ui/home_view.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          Home(),
          HomeView(),
          TfliteMl(),
          About(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular_outlined),
            label: "RealTimeDetect",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: "ObjectDetect",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: "About",
          ),
        ],
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 9, 255, 0),
        backgroundColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
