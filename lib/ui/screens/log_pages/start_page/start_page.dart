import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/resources/resources.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/navigation/auto_router.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightPink,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _CreateAppLogoWidget(),
              _CreateAppNameWidget(),
              _CreateAppDesriptionWidget(),
            ],
          ),
          _SignMethodsWidget(),
        ],
      )),
    );
  }
}

class _SignMethodsWidget extends StatelessWidget {
  const _SignMethodsWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              width: 140,
              onPressed: () {
                context.router.navigate(const SignInRoute());
              },
              buttonText: 'Sign In'),
          const SizedBox(
            width: 30,
          ),
          CustomButton(
              width: 140,
              onPressed: () {
                context.navigateTo(const SignUpRoute());
              },
              buttonText: 'Sign Up'),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}

class _CreateAppDesriptionWidget extends StatelessWidget {
  const _CreateAppDesriptionWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w900,
          color: AppColors.redBrown,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _CreateAppNameWidget extends StatelessWidget {
  const _CreateAppNameWidget();

  @override
  Widget build(BuildContext context) {
    return Text('Daily Notes',
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.chloe.font,
          color: AppColors.green,
        ));
  }
}

class _CreateAppLogoWidget extends StatelessWidget {
  const _CreateAppLogoWidget();

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
