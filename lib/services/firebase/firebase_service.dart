// ignore_for_file: use_build_context_synchronously
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/ui/navigation/auto_router.dart';
import 'package:notes_app/ui/navigation/go_router.dart';
import 'package:notes_app/ui/widgets/app_alert.dart';

class FireBaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  Future<bool> signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print('Error google signing in: $e');
      return false;
    }
  }

  Future<void> signUp(
      BuildContext context, emailController, passwordController) async {
    bool success = await FireBaseFunctions()
        .register(emailController.text, passwordController.text);
    if (success) {
      // return context.go(routeNameMap[RouteName.home]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const SignAlert(text: 'Invalid email or password'),
      );
    }
  }

  Future<void> validSignWithGoogle(BuildContext context) async {
    bool success = await FireBaseFunctions().signInWithGoogle();
    if (success) {
      // return context.go(routeNameMap[RouteName.home]!);
    } else {
      await showDialog(
        context: context,
        builder: (context) => const SignAlert(text: 'Sign In error'),
      );
    }
  }

  void resetPassword(BuildContext context, TextEditingController controller) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Reset password'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            controller: controller,
            placeholder: 'Enter Email',
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Send'),
            onPressed: () async {
              await FirebaseAuth.instance.sendPasswordResetEmail(
                email: controller.text,
              );
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> deleteAccount() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      try {
        await user.delete();
        print('User account deleted');
      } catch (e) {
        print('Error deleting account: $e');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<bool> _signInCheck(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    bool success = await _signInCheck(email, password);
    if (success) {
      return context.router.navigate(ButtomTabBarRoute());
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const SignAlert(text: 'Invalid email or password'),
      );
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }

  Future<void> changePassword(String password, String newPassword,
      BuildContext context, User? user) async {
    if (password == newPassword) {
      await user?.updatePassword(password);
      context.pop();
    } else {
      showDialog(
        context: context,
        builder: (context) => const SignAlert(text: 'Password missmatch'),
      );
    }
  }
}
