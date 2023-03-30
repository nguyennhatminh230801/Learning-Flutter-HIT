import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_buoi_4/bloc/category/category_bloc.dart';
import 'package:homework_buoi_4/bloc/category/category_event.dart';
import 'package:homework_buoi_4/bloc/category/category_state.dart';
import 'package:homework_buoi_4/di/register_locator.dart';
import 'package:homework_buoi_4/ui/category/category_item.dart';

import '../widget/loading_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.title});

  final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<CategoryBloc>()..add(LoadedCategoryEvent()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(CategoryState state) {
     if (state is LoadedCategoryState) {
      final listCategory = state.listCategory;
      return GridView.builder(
        itemCount: listCategory.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(category: listCategory[index]);
        },
      );
    } else {
      return const LoadingScreen();
    }
  }
}

