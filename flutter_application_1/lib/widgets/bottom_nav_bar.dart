import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      type: BottomNavigationBarType.fixed,

      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,

      selectedFontSize: 10,
      unselectedFontSize: 10,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Dashboard',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          activeIcon: Icon(Icons.inventory_2),
          label: 'Product',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_outlined),
          activeIcon: Icon(Icons.inventory),
          label: 'Stock',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: 'Sales',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Settings',
        ),
      ],
    );
  }
}
