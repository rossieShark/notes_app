import 'package:flutter/cupertino.dart';

import 'package:notes_app/resources/resources.dart';
import 'package:notes_app/services/services_index.dart';

class SignMethods extends StatelessWidget {
  final VoidCallback onGoogleTap;

  const SignMethods({super.key, required this.onGoogleTap});
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _GoogleSignIn(onGoogleTap: onGoogleTap),
          const SizedBox(
            width: 7,
          ),
          const _FacebookSignIn(),
          const SizedBox(
            width: 5,
          ),
          const _AppleSignIn(),
        ]);
  }
}

class _AppleSignIn extends StatelessWidget {
  const _AppleSignIn();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Image.asset(
        AppImages.apple,
        color: AppColors.white,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _FacebookSignIn extends StatelessWidget {
  const _FacebookSignIn();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(
          AppImages.facebook,
          fit: BoxFit.cover,
        ));
  }
}

class _GoogleSignIn extends StatelessWidget {
  const _GoogleSignIn({
    required this.onGoogleTap,
  });

  final VoidCallback onGoogleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onGoogleTap,
      child: SizedBox(
          width: 18,
          height: 18,
          child: Image.asset(
            AppImages.google,
            fit: BoxFit.cover,
          )),
    );
  }
}
