import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    required this.id, required this.categories, required this.title, required this.affordability,
    required this.complexity, required this.imageUrl, required this.duration, required this.ingredients,
    required this.steps, required this.isGlutenFree, required this.isVegan, required this.isVegetarian,
    required this.isLactoseFree
  });

  @override
  List<Object?> get props =>
      [id, categories, affordability, complexity,
        imageUrl, duration, ingredients, steps,
        isGlutenFree, isVegan, isVegetarian, isLactoseFree];
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard
}