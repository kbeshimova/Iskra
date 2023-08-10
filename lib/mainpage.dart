import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iskra/filters.dart';
import 'package:iskra/global.dart';
import 'package:iskra/metchi.dart';
import 'package:iskra/swipe.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [Swipe(), FilterSwipe(), Matches()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            gradient: primaryGradient,
            borderRadius: BorderRadius.circular(40),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: white.withOpacity(0.5),
            unselectedItemColor: Colors.white,
            selectedFontSize: 12,
            unselectedLabelStyle: TextStyle(height: 2),
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              for (var i = 0; i < tabData.length; i++)
                BottomNavigationBarItem(
                  icon: Opacity(
                    opacity: currentIndex == i ? 0.4 : 1,
                    child: Image.asset(
                      tabData[i].img,
                      height: 25,
                    ),
                  ),
                  label: tabData[i].label,
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<TabData> tabData = [
    TabData(img: 'assets/icons/swipe.png', label: 'Свайпы'),
    TabData(img: 'assets/icons/account.png', label: 'Подборки'),
    TabData(img: 'assets/icons/subtract.png', label: 'Мэтчи'),
  ];
}

class TabData {
  String img;
  String label;
  TabData({required this.img, required this.label});
}
