import 'package:get_it/get_it.dart';
import 'package:homework_buoi_4/bloc/category/category_bloc.dart';
import 'package:homework_buoi_4/bloc/listfood/list_food_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _init(getIt);
}

void _init(GetIt getIt) {
  getIt.registerFactory<CategoryBloc>(() => CategoryBloc());
  getIt.registerFactory<ListFoodBloc>(() => ListFoodBloc());
}
