import 'package:buoi_5/screen/list_customer/widget/search_app_bar.dart';
import 'package:flutter/material.dart';

class ListCustomerScreen extends StatelessWidget {
  const ListCustomerScreen({Key? key}) : super(key: key);

  static const listTab = [
    Tab(
      child: Text(
        "Tất cả",
        style: TextStyle(color: Colors.black),
      ),
    ),
    Tab(
      child: Text(
        "Khách hàng",
        style: TextStyle(color: Colors.black),
      ),
    ),
    Tab(
      child: Text(
        "Khách hàng và Nhà Cung Cấp",
        style: TextStyle(color: Colors.black),
      ),
    ),
    Tab(
      child: Text(
        "Nhà cung cấp",
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SearchAppBar(),
        DefaultTabController(
            length: 4,
            child: TabBar(
                isScrollable: true,
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                tabs: listTab
            )
        )
      ],
    ));
  }
}
