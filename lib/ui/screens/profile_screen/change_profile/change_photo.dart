import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';

class ChangePhotoWidget extends StatefulWidget {
  const ChangePhotoWidget({super.key});

  @override
  State<ChangePhotoWidget> createState() => _ChangePhotoWidgetState();
}

class _ChangePhotoWidgetState extends State<ChangePhotoWidget> {
  ImagePickerService imagePickerService = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                        isDefaultAction: true,
                        child: const _ActionSheetChild(
                          actionText: ' Gallery',
                          icon: Icons.image,
                        ),
                        onPressed: () async {
                          context
                              .read<ImageBloc>()
                              .add(PickAndUploadImageEvent());
                          context.pop();
                        }),
                    CupertinoActionSheetAction(
                      child: const _ActionSheetChild(
                        actionText: ' Camera',
                        icon: Icons.camera_alt,
                      ),
                      onPressed: () {
                        context
                            .read<ImageBloc>()
                            .add(PickfromCamAndUploadImageEvent());
                        context.pop();
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: AppFonts.versailles.font,
                          fontSize: 14,
                          fontWeight: FontWeight.w900),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ));
      },
      child:
          Text('Change photo', style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class _ActionSheetChild extends StatelessWidget {
  final String actionText;
  final IconData icon;
  const _ActionSheetChild({
    required this.actionText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.darkRedBrown),
        Text(
          actionText,
          style: TextStyle(
              color: AppColors.darkRedBrown,
              fontFamily: AppFonts.versailles.font,
              fontSize: 14,
              fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
