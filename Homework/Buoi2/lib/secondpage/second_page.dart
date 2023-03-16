import 'package:flutter/material.dart';
import 'package:homework_buoi2/constant.dart';

import 'TabbarItem.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class TransactionItem {
  final String username;
  final String description;
  final String money;
  final Icon icons;

  TransactionItem({
    required this.username,
    required this.description,
    required this.money,
    required this.icons,
  });
}

class _SecondPageState extends State<SecondPage> {
  final listTransactionItem = [
    TransactionItem(
        username: "Truong Thanh Chien",
        description: "Chien chuyen tien hoc",
        money: "10.000.000",
        icons: const Icon(Icons.arrow_right_alt, color: Colors.green)
    ),
    TransactionItem(
        username: "Truong Thanh Chien",
        description: "Chien chuyen tien hoc",
        money: "10.000.000",
        icons: const Icon(Icons.arrow_back, color: Colors.red)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(BACKGROUND_URL), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  buildMoreButton(),
                  buildShowMoney(),
                  buildTabbar(),
                  buildShowTransaction(listTransactionItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShowTransaction(List<TransactionItem> listTransactionItem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitleTransaction(),
            buildDateTransaction(),
            Expanded(
              child: ListView.builder(
                  itemCount: listTransactionItem.length,
                  itemBuilder: (context, index) {
                    final item = listTransactionItem[index];
                    return buildItemListTransaction(
                        username: item.username,
                        description: item.description,
                        money: item.money,
                        icons: item.icons
                    );
                  },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemListTransaction({
    required String username,
    required String description,
    required String money,
    required Icon icons,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            icons,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          username,
                          maxLines: 1,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text("+$money",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  Text(description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateTransaction() {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        "Hôm nay, 16 Thg 3, 2023",
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget buildTitleTransaction() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Lịch sử giao dịch",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.replay)
          ],
        ),
      ),
    );
  }

  Widget buildTabbar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabbarItem(
              tabText: "Tài khoản và thẻ",
              icons: Icons.wallet,
            ),
            TabbarItem(
              tabText: "Rút tiền",
              icons: Icons.attach_money,
            ),
            TabbarItem(
              tabText: "Chuyển tiền",
              icons: Icons.swap_horiz_sharp,
            ),
            TabbarItem(
              tabText: "Mã QR Code",
              icons: Icons.qr_code,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShowMoney() {
    return Container(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Icon(
                  Icons.home_filled,
                  color: Colors.orange,
                  size: 35,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Số dư khả dụng"),
                      Text(
                        "49999999999999999999999999999999999999999999999",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMoreButton() {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: IconButton(
            icon: const Icon(Icons.more_horiz, size: 25),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ),
    );
  }


}
