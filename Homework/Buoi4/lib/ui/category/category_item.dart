import 'package:flutter/material.dart';
import 'package:homework_buoi_4/util/constant/constant.dart';

import '../../model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(RouteConstant.listFoodScreenPath, arguments: category),
          child: Card(
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
