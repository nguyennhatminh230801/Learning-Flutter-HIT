import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_buoi_4/bloc/listfood/list_food_event.dart';
import 'package:homework_buoi_4/bloc/listfood/list_food_state.dart';

import '../../util/data/data.dart';

class ListFoodBloc extends Bloc<ListFoodEvent, ListFoodState> {
  ListFoodBloc() : super(InitListFoodState()) {
    on<LoadedListFoodEvent>(
        (event, emit) => _getListMealByCategory(event, emit) );
  }

  void _getListMealByCategory(
      LoadedListFoodEvent event, Emitter<ListFoodState> emit) {
    emit(LoadingListFoodState());

    final listMeal = DUMMY_MEALS
        .where((meals) => meals.categories
            .where((category) => category == event.categoryID)
            .isNotEmpty)
        .toList();

    emit(LoadedListFoodState(listMeals: listMeal));
  }
}
