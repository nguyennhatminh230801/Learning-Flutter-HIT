
import 'dart:ui';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.color
  });

  @override
  List<Object?> get props => [id, title, color];
}