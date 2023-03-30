import 'package:equatable/equatable.dart';

abstract class ListFoodEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingListFoodEvent extends ListFoodEvent {}

class LoadedListFoodEvent extends ListFoodEvent {
  final String categoryID;

  LoadedListFoodEvent({required this.categoryID});
}
