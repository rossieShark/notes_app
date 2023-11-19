// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:notes_app/domain/models/categories_model.dart';

class NotesModel extends Equatable {
  final String index;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final CategoriesModel category;
  final bool isComplete;
  final bool isOver;

  const NotesModel(
      {required this.index,
      required this.title,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.description,
      required this.category,
      required this.isComplete,
      required this.isOver});

  NotesModel copyWith(
      {String? index,
      String? title,
      String? date,
      String? startTime,
      String? endTime,
      String? description,
      CategoriesModel? category,
      bool? isComplete,
      bool? isOver}) {
    return NotesModel(
        index: index ?? this.index,
        title: title ?? this.title,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        description: description ?? this.description,
        category: category ?? this.category,
        isComplete: isComplete ?? this.isComplete,
        isOver: isOver ?? this.isOver);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      index,
      title,
      date,
      startTime,
      endTime,
      description,
      category,
      isComplete,
      isOver
    ];
  }
}
