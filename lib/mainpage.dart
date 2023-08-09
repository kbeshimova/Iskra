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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(gradient: primaryGradient),
        child: BottomNavigationBar(
          fixedColor: white,
          showUnselectedLabels: true,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedLabelStyle: TextStyle(height: 2),
          selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/swipe.png',
                height: 25,
              ),
              label: 'Свайпы',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/account.png',
                height: 25,
              ),
              label: 'Подборки',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/subtract.png',
                height: 25,
              ),
              label: 'Мэтчи',
            ),
          ],
        ),
      ),
    );
  }
}
