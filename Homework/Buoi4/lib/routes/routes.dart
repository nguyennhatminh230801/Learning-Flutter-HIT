import 'package:flutter/material.dart';
import 'package:homework_buoi_4/model/meal.dart';
import 'package:homework_buoi_4/ui/category/category_screen.dart';
import 'package:homework_buoi_4/ui/detailfood/detail_food_screen.dart';
import 'package:homework_buoi_4/ui/listfood/list_food_screen.dart';
import 'package:homework_buoi_4/util/constant/constant.dart';

import '../model/category.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.categoryScreenPath:
        return MaterialPageRoute(
            builder: (context) => const CategoryScreen(title: StringConstant.categoryScreenTitle));
      case RouteConstant.detailFoodScreenPath:
        Meal meal = settings.arguments as Meal;
        return MaterialPageRoute(
            builder: (context) => DetailFoodScreen(meal: meal));
      case RouteConstant.listFoodScreenPath:
        Category category = settings.arguments as Category;
        return MaterialPageRoute(
            builder: (context) => ListFoodScreen(
                  category: category,
                ));
      default:
        return null;
    }
  }
}
