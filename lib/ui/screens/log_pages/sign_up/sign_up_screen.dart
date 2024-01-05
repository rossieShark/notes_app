// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/resources/resources.dart';
import 'package:notes_app/ui/screens/screens_index.dart';

import 'package:notes_app/ui/widgets/widgets_index.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  late TextEditingController _signUpTextController;
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
    _signUpTextController = TextEditingController();
    _signUpTextController.addListener(() {
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
    _signUpTextController.dispose();
    _passwordTextController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
                const _CreateLogoWidget(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      EmailTextFields(
                        focusNode: _emailFocusNode,
                        signUpTextController: _signUpTextController,
                      ),
                      CreatePasswordTextField(
                        passwordController: _passwordTextController,
                        focusNode: _passwordFocusNode,
                        hintText: 'Enter password',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        FireBaseFunctions().signUp(context,
                            _signUpTextController, _passwordTextController);
                      },
                      buttonText: 'Sign Up',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('You can sign up with',
                          style: Theme.of(context).textTheme.labelLarge),
                    ),
                    SignMethods(onGoogleTap: () {
                      FireBaseFunctions().validSignWithGoogle(context);
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    const _CreateLoginWidget()
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

class _CreateLogoWidget extends StatelessWidget {
  const _CreateLogoWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Image.asset(
          width: 300,
          AppImages.logo2,
        ),
      ),
    );
  }
}

class _CreateLoginWidget extends StatelessWidget {
  const _CreateLoginWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Already have an account?',
            style: Theme.of(context).textTheme.labelLarge),
        GestureDetector(
            onTap: () {
              //context.go(routeNameMap[RouteName.sigIn]!);
            },
            child: const Text(
              ' Sign In',
              style: TextStyle(
                  color: AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w900),
            )),
      ],
    );
  }
}
