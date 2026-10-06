import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/add_product.dart';
import 'package:flutter_application_1/screen/dashboard_screen.dart';
import 'package:flutter_application_1/screen/delete_product.dart';
import 'package:flutter_application_1/screen/edit_product.dart';
import 'package:flutter_application_1/screen/enter_otp.dart';
import 'package:flutter_application_1/screen/forget_password_screen.dart';
import 'package:flutter_application_1/screen/login_screen.dart';
import 'package:flutter_application_1/screen/main_screen.dart';
import 'package:flutter_application_1/screen/price_range.dart';
import 'package:flutter_application_1/screen/product_details1.dart';
import 'package:flutter_application_1/screen/product_details2.dart';
import 'package:flutter_application_1/screen/product_screen.dart';
import 'package:flutter_application_1/screen/register_screen.dart';
import 'package:flutter_application_1/screen/splash_screen.dart';
import 'package:flutter_application_1/screen/update_stock_screen.dart';
import 'package:flutter_application_1/screen/settings_screen.dart';
import 'package:flutter_application_1/screen/total_stock_screen.dart';
import 'package:flutter_application_1/screen/low_stock_screen.dart';
import 'package:flutter_application_1/screen/about_app_screen.dart';
import 'package:flutter_application_1/screen/change_password_screen.dart';
import 'package:flutter_application_1/screen/sales_screen.dart';
import 'package:flutter_application_1/screen/record_sales_screen.dart';
import 'package:flutter_application_1/screen/analytics_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainScreen(),

    );
  }
}
