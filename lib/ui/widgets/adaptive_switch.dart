import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';

class AdaptiveSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AdaptiveSwitch(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // For iOS
      return CupertinoSwitch(
        activeColor: AppColors.green,
        thumbColor: AppColors.white,
        trackColor: AppColors.pink,
        value: value,
        onChanged: onChanged,
      );
    } else {
      // For Material
      return Switch(
        activeColor: AppColors.green,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.pink,
        value: value,
        onChanged: onChanged,
      );
    }
  }
}
