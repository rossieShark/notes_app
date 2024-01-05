// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';

class ControllerModel {
  TextEditingController controller;
  bool isValid;
  ControllerModel({
    required this.controller,
    required this.isValid,
  });

  ControllerModel copyWith({
    TextEditingController? controller,
    bool? isValid,
  }) {
    return ControllerModel(
      controller: controller ?? this.controller,
      isValid: isValid ?? this.isValid,
    );
  }
}

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc()
      : super(const TextFieldState(controllers: {}, isValid: true)) {
    on<TextFieldControllerAddedEvent>(_controllerAddedEvent);
    on<TextFieldControllerTextChangedEvent>(_onTextChangedEvent);

    on<TextFieldControllerIsValidEvent>(_controllersIsValidEvent);
    on<RemoveAllEvent>(_onRemoveAllEvent);
  }

  void _controllerAddedEvent(
      TextFieldControllerAddedEvent event, Emitter<TextFieldState> emit) async {
    final newControllers = Map.of(state.controllers);
    newControllers[event.key] =
        ControllerModel(controller: event.controller, isValid: true);
    emit(TextFieldState(controllers: newControllers, isValid: state.isValid));
  }

  void _onTextChangedEvent(TextFieldControllerTextChangedEvent event,
      Emitter<TextFieldState> emit) async {
    final newControllers = Map.of(state.controllers);
    newControllers[event.key] = ControllerModel(
        controller: event.controller, isValid: _isValid(event.newText));

    emit(TextFieldState(controllers: newControllers, isValid: state.isValid));
  }

  void _onRemoveAllEvent(
      RemoveAllEvent event, Emitter<TextFieldState> emit) async {
    emit(const TextFieldState(controllers: {}, isValid: false));
  }

  void _controllersIsValidEvent(TextFieldControllerIsValidEvent event,
      Emitter<TextFieldState> emit) async {
    final Map<String, ControllerModel> updatedControllers =
        Map.from(state.controllers);

    state.controllers.forEach((key, value) {
      final isValid = _isValid(value.controller.text);
      updatedControllers[key] =
          ControllerModel(controller: value.controller, isValid: isValid);
    });

    final isValid = isAllControllersValid(updatedControllers);
    emit(TextFieldState(controllers: updatedControllers, isValid: isValid));
  }

  bool _isValid(String text) {
    return text.isNotEmpty;
  }

  bool isAllControllersValid(Map<String, ControllerModel> controllers) {
    return controllers.isEmpty
        ? false
        : controllers.values.every((values) {
            return values.isValid;
          });
  }
}
