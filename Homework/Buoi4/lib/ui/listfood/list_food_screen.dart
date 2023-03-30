import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_buoi_4/bloc/listfood/list_food_bloc.dart';
import 'package:homework_buoi_4/bloc/listfood/list_food_event.dart';
import 'package:homework_buoi_4/bloc/listfood/list_food_state.dart';
import 'package:homework_buoi_4/di/register_locator.dart';
import 'package:homework_buoi_4/ui/listfood/item_meal.dart';
import 'package:homework_buoi_4/ui/widget/loading_screen.dart';

import '../../model/category.dart';

class ListFoodScreen extends StatefulWidget {
  const ListFoodScreen({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  State<ListFoodScreen> createState() => _ListFoodScreenState();
}

class _ListFoodScreenState extends State<ListFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ListFoodBloc>()
        ..add(LoadedListFoodEvent(categoryID: widget.category.id)),
      child: BlocBuilder<ListFoodBloc, ListFoodState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.category.title),
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(ListFoodState state) {
    if (state is LoadedListFoodState) {
      final listMeal = state.listMeals;
      return ListView.builder(
          itemCount: listMeal.length,
          itemBuilder: (context, index) => ItemMeal(meal: listMeal[index]),
      );
    } else {
      return const Center(child: LoadingScreen());
    }
  }
}

