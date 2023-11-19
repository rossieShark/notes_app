import 'package:equatable/equatable.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';

class TextFieldState extends Equatable {
  final Map<String, ControllerModel> controllers;
  final bool isValid;

  const TextFieldState({
    required this.controllers,
    required this.isValid,
  });

  @override
  List<Object?> get props => [controllers];

  TextFieldState copyWith({
    required Map<String, ControllerModel> controllers,
    bool? isValid,
  }) {
    return TextFieldState(
      controllers: controllers,
      isValid: isValid ?? this.isValid,
    );
  }
}
