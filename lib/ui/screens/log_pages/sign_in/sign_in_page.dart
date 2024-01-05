// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/services/services_index.dart';

import 'package:notes_app/resources/resources.dart';
import 'package:notes_app/ui/navigation/auto_router.dart';

import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;

  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _initializeControllers();
    _initializeFocusNode();
    super.initState();
  }

  void _initializeControllers() {
    _loginTextController = TextEditingController();
    _loginTextController.addListener(() {
      setState(() {});
    });
    _passwordTextController = TextEditingController();
    _passwordTextController.addListener(() {
      setState(() {});
    });
  }

  void _initializeFocusNode() {
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      width: 300,
                      AppImages.logo2,
                    ),
                  ),
                ),
                CreateSignTextFields(
                  emailFocusNode: _emailFocusNode,
                  loginTextController: _loginTextController,
                  passwordFocusNode: _passwordFocusNode,
                  passwordTextController: _passwordTextController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    CustomButton(
                        onPressed: () {
                          FireBaseFunctions().signIn(_loginTextController.text,
                              _passwordTextController.text, context);
                        },
                        buttonText: 'Sign In'),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('You can sign in with',
                          style: Theme.of(context).textTheme.labelLarge),
                    ),
                    SignMethods(
                      onGoogleTap: () {
                        FireBaseFunctions().validSignWithGoogle(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _CreateRegisterWidget()
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    );
  }
}

class _CreateRegisterWidget extends StatelessWidget {
  const _CreateRegisterWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Don't have an account ?",
            style: Theme.of(context).textTheme.labelLarge),
        GestureDetector(
            onTap: () {
              context.router.push(const SignUpRoute());
            },
            child: const Text(
              ' Sign Up',
              style: TextStyle(
                  color: AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w900),
            )),
      ],
    );
  }
}
