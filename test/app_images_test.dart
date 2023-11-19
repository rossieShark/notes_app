import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.apple).existsSync(), isTrue);
    expect(File(AppImages.editing).existsSync(), isTrue);
    expect(File(AppImages.facebook).existsSync(), isTrue);
    expect(File(AppImages.google).existsSync(), isTrue);
    expect(File(AppImages.home).existsSync(), isTrue);
    expect(File(AppImages.logo2).existsSync(), isTrue);
    expect(File(AppImages.other).existsSync(), isTrue);
    expect(File(AppImages.star).existsSync(), isTrue);
    expect(File(AppImages.study).existsSync(), isTrue);
    expect(File(AppImages.user).existsSync(), isTrue);
    expect(File(AppImages.work).existsSync(), isTrue);
  });
}
