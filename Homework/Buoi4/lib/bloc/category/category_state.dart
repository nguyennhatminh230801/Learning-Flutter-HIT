import 'package:equatable/equatable.dart';
import 'package:homework_buoi_4/model/category.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  final List<Category> listCategory;

  LoadedCategoryState({ required this.listCategory });

  @override
  List<Object?> get props => [listCategory];
}