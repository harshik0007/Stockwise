import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/product_screen.dart';
import 'package:flutter_application_1/stock/total_stock_screen.dart';

import '../widgets/bottom_nav_bar.dart';

import 'package:flutter_application_1/dashboard/dashboard_screen.dart';

import 'package:flutter_application_1/sales/sales_screen.dart';
import 'package:flutter_application_1/user/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentIndex = widget.initialIndex;

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
      body: currentIndex == 0
          ? DashboardScreen(onProductsTap: () => setState(() => currentIndex = 1))
          : screens[currentIndex],

      // ONLY ONE NAVIGATION BAR
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,

        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
