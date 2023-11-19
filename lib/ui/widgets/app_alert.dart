import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class AppAlertDialog extends StatelessWidget {
//   final Function onConfirm;
//   final String title;
//   final String subtitle;

//   const AppAlertDialog({
//     Key? key,
//     required this.onConfirm,
//     required this.title,
//     required this.subtitle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS
//         ? CupertinoAlertDialog(
//             title: Text(title, style: Theme.of(context).textTheme.labelLarge,),
//             content: Text(subtitle, style: Theme.of(context).textTheme.labelLarge,),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 onPressed: () => onConfirm(),
//                 child:  Text('Confirm', style: Theme.of(context).textTheme.labelLarge,),
//               ),
//               CupertinoDialogAction(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child:  Text('Cancel', style: Theme.of(context).textTheme.labelLarge,),
//               ),
//             ],
//           )
//         : AlertDialog(
//             title: Text(title, style: Theme.of(context).textTheme.labelLarge,),
//             content: Text(subtitle, style: Theme.of(context).textTheme.labelLarge,),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child:  Text('Cancel', style: Theme.of(context).textTheme.labelLarge,),
//               ),
//               TextButton(
//                 onPressed: () => onConfirm(),
//                 child:  Text('Confirm', style: Theme.of(context).textTheme.labelLarge,),
//               ),
//             ],
//           );
//   }
// }

class SignAlert extends StatelessWidget {
  final String text;

  const SignAlert({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            content: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: Text(
                  'Ok',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        : AlertDialog(
            content: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          );
  }
}
