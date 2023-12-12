import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class CreateSignTextFields extends StatelessWidget {
  const CreateSignTextFields({
    super.key,
    required FocusNode emailFocusNode,
    required TextEditingController loginTextController,
    required FocusNode passwordFocusNode,
    required TextEditingController passwordTextController,
  })  : _emailFocusNode = emailFocusNode,
        _loginTextController = loginTextController,
        _passwordFocusNode = passwordFocusNode,
        _passwordTextController = passwordTextController;

  final FocusNode _emailFocusNode;
  final TextEditingController _loginTextController;
  final FocusNode _passwordFocusNode;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: AuthTextField(
              obscureText: false,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              controller: _loginTextController,
              hintText: 'Enter email',
            ),
          ),
          CreatePasswordTextField(
            focusNode: _passwordFocusNode,
            passwordController: _passwordTextController,
            hintText: 'Enter password',
          ),
          const SizedBox(
            height: 8,
          ),
          _CreateForgetPasswordWidget()
        ],
      ),
    );
  }
}

class _CreateForgetPasswordWidget extends StatelessWidget {
  _CreateForgetPasswordWidget();

  final TextEditingController _resetPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FireBaseFunctions()
          .resetPassword(context, _resetPasswordTextController),
      child: const SizedBox(
        width: 400,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Text('Forgot password?',
                style: TextStyle(
                    color: AppColors.darkRedBrown,
                    fontSize: 10,
                    fontWeight: FontWeight.w800))),
      ),
    );
  }
}
