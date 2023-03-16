import 'package:flutter/material.dart';

class TabbarItem extends StatelessWidget {
  final String tabText;
  final IconData icons;
  const TabbarItem({
    super.key,
    required this.tabText,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: SizedBox(
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icons, color: Colors.orange),
            Text(tabText,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}