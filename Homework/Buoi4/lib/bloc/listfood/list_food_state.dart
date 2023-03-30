import 'package:equatable/equatable.dart';

import '../../model/meal.dart';

abstract class ListFoodState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitListFoodState extends ListFoodState {}

class LoadingListFoodState extends ListFoodState {}

class LoadedListFoodState extends ListFoodState {
  final List<Meal> listMeals;
  LoadedListFoodState({required this.listMeals});

  @override
  List<Object?> get props => [listMeals];
}