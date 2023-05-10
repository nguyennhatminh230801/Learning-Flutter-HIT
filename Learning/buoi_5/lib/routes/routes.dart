import 'package:buoi_5/screen/add_customer/add_customer_screen.dart';
import 'package:buoi_5/screen/list_customer/list_customer_screen.dart';
import 'package:buoi_5/screen/whole_app_widget/UnknownScreen.dart';
import 'package:flutter/material.dart';

class RouteConstant {
  static const String addCustomerPath = "/add_customer";
  static const String listCustomerPath = "/";
}

class RouteGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.listCustomerPath:
        return MaterialPageRoute(builder: (_) => const ListCustomerScreen());
      case RouteConstant.addCustomerPath:
        return MaterialPageRoute(builder: (_) => const AddCustomerScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }
}
