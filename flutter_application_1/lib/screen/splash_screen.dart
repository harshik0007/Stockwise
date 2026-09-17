import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 80, color: Colors.blue),

            const SizedBox(height: 8),

            Text(
              'StockWise',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              'Simple Inventory',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),

            Text('System', style: TextStyle(fontSize: 12, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
