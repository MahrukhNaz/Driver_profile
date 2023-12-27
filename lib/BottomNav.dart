import 'package:flutter/material.dart';
import 'package:driver_profile/ratingTab.dart';
import 'package:driver_profile/earningTab.dart';
import 'package:driver_profile/profileTab.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Define the onItemClicked method
  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      pageController.jumpToPage(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(), // Placeholder for Home, showing nothing
          DriverEarningsPage(),
          RatingTabPage(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Earnings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Ratings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index) {
          onItemClicked(index);
        },
      ),
    );
  }
}
                                                