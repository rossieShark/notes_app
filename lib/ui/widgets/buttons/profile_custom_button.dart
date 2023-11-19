import 'package:flutter/material.dart';
import 'package:notes_app/services/ui_service/ui_colors.dart';

class ProfileCustomButton extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final Widget? child;
  final VoidCallback onTap;
  const ProfileCustomButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    required this.buttonText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.white,
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: AppColors.redBrown,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(buttonText, style: Theme.of(context).textTheme.labelLarge),
                const Expanded(child: SizedBox()),
                child ?? const SizedBox()
              ],
            )),
      ),
    );
  }
}
