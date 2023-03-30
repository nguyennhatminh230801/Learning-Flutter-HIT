import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_buoi_4/bloc/category/category_event.dart';
import 'package:homework_buoi_4/bloc/category/category_state.dart';

import '../../util/data/data.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(LoadingCategoryState()) {
    on<LoadedCategoryEvent>((event, emit) =>
        emit(LoadedCategoryState(listCategory: DUMMY_CATEGORIES)));
  }
}