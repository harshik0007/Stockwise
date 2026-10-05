import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/product_screen.dart';
import 'package:flutter_application_1/screen/total_stock_screen.dart';

import '../widgets/bottom_nav_bar.dart';

import 'dashboard_screen.dart';

import 'sales_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    DashboardScreen(),
    ProductScreen(),
    TotalStockScreen(),
    SalesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Current screen
      body: screens[currentIndex],

      // ONLY ONE NAVIGATION BAR
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
