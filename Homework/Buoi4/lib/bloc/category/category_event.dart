import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingCategoryEvent extends CategoryEvent {}

class LoadedCategoryEvent extends CategoryEvent {}