import 'package:flutter/material.dart';

import '../constant.dart';
import 'itemdata.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final listItemData = [
    ItemData(
        backgroundItemColor: Colors.blue,
        icons: Icons.wallet,
        name: "My Account"),
    ItemData(
        backgroundItemColor: Colors.purple,
        icons: Icons.location_on,
        name: "Address"),
    ItemData(
        backgroundItemColor: Colors.orange,
        icons: Icons.settings,
        name: "Settings"),
    ItemData(
        backgroundItemColor: Colors.purple,
        icons: Icons.help_outline_sharp,
        name: "Help Center"),
    ItemData(
        backgroundItemColor: Colors.blue, icons: Icons.phone, name: "Contact"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          buildHeading(),
          buildUserInfo(),
          buildListButton(),
          buildLogoutButton(),
        ]),
      ),
    );
  }

  Expanded buildListButton() {
    return Expanded(
      child: ListView.builder(
          itemCount: listItemData.length,
          itemBuilder: (context, position) {
            var itemData = listItemData[position];
            return buildItem(
                backgroundItemColor: itemData.backgroundItemColor,
                icons: itemData.icons,
                name: itemData.name);
          }),
    );
  }

  Widget buildItem({
    Color backgroundItemColor = Colors.black,
    required IconData icons,
    required String name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: backgroundItemColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Icon(
                  icons,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 100,
              height: 100,
              child: ClipOval(child: Image.network(IMAGE_URL))),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Alex Bendra",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "6868 8686 9999",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeading() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          )
        ],
      ),
    );
  }

  Widget buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0x80E14BAE)),
          onPressed: () {},
          child: const Text(
            "Log out",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
