import 'package:flutter/material.dart';

abstract class TextFieldEvent {}

class TextFieldButtonTappedEvent extends TextFieldEvent {
  final bool isButtonTapped;

  TextFieldButtonTappedEvent(this.isButtonTapped);
}

class TextFieldControllerAddedEvent extends TextFieldEvent {
  final TextEditingController controller;
  final String key;

  TextFieldControllerAddedEvent(this.controller, this.key);
}

class RemoveAllEvent extends TextFieldEvent {
  RemoveAllEvent();
}

class TextFieldControllerTextChangedEvent extends TextFieldEvent {
  final TextEditingController controller;
  final String key;
  final String newText;

  TextFieldControllerTextChangedEvent(this.controller, this.newText, this.key);
}

class TextFieldControllerIsValidEvent extends TextFieldEvent {
  // final bool buttonIsTapped;
  TextFieldControllerIsValidEvent();
}
