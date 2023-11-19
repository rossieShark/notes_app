// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _passwordController;
  late TextEditingController _newPasswordController;

  late FocusNode _passwordFocusNode;

  late FocusNode _newPasswordFocusNode;
  late User? _user;
  bool obscureText = true;
  bool newObscureText = true;

  @override
  void initState() {
    super.initState();
    _initializeValues();
    _authState();
  }

  void _initializeValues() {
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _newPasswordFocusNode = FocusNode();
    _newPasswordFocusNode.addListener(() {
      setState(() {});
    });
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  void _authState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          _user = user;
        });
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _passwordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.yellow,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: CreatePasswordTextField(
                          passwordController: _passwordController,
                          focusNode: _passwordFocusNode,
                          hintText: 'Enter password'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: CreatePasswordTextField(
                          passwordController: _newPasswordController,
                          focusNode: _newPasswordFocusNode,
                          hintText: 'Confirm password'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      width: 120,
                      onPressed: () {
                        FireBaseFunctions().changePassword(
                            _passwordController.text,
                            _newPasswordController.text,
                            context,
                            _user);
                      },
                      buttonText: 'Change'),
                ],
              ),
            ),
          ),
        ));
  }
}
