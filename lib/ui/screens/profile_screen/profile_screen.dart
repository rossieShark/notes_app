// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/resources/resources.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;
import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

@RoutePage()
class ProfileScreenPage extends StatelessWidget {
  const ProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 40,
            ),
            const _CreateUserInfoWidget(),
            const SizedBox(
              height: 40,
            ),
            const _ChangeUserInfoWidget(),
            const SizedBox(
              height: 10,
            ),
            ProfileCustomButton(
                iconData: Icons.notifications,
                onTap: () {},
                buttonText: 'Notifications',
                child: AdaptiveSwitch(value: true, onChanged: (value) {})),
            const SizedBox(
              height: 10,
            ),
            const _ChangePasswordWidget(),
            const SizedBox(
              height: 10,
            ),
            const _LogOutWidget(),
            const SizedBox(
              height: 50,
            ),
            const _DeleteAccountWidget(),
          ],
        ),
      )),
    );
  }
}

class _CreateUserInfoWidget extends StatelessWidget {
  const _CreateUserInfoWidget();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150 / 2),
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: snapshot.data?.photoURL != null
                          ? Image.network(
                              snapshot.data!.photoURL!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImages.user,
                              fit: BoxFit.cover,
                            )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    snapshot.data?.displayName ?? 'User',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          );
        });
  }
}

class _DeleteAccountWidget extends StatelessWidget {
  const _DeleteAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          await FireBaseFunctions().deleteAccount();
          // ignore: use_build_context_synchronously
          //context.pushReplacement(routeNameMap[RouteName.start]!);
        },
        child: const Text(
          'Delete account',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class _LogOutWidget extends StatelessWidget {
  const _LogOutWidget();

  @override
  Widget build(BuildContext context) {
    return ProfileCustomButton(
      onTap: () async {
        await FireBaseFunctions().signOut();
        // ignore: use_build_context_synchronously
        // context.pushReplacement(routeNameMap[RouteName.start]!);
      },
      iconData: Icons.logout,
      buttonText: 'Log out',
    );
  }
}

class _ChangePasswordWidget extends StatelessWidget {
  const _ChangePasswordWidget();

  @override
  Widget build(BuildContext context) {
    return ProfileCustomButton(
      iconData: Icons.key,
      onTap: () => _onTap(context),
      buttonText: 'Change password',
    );
  }

  void _onTap(BuildContext context) {
    modal.showBarModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChangePassword(),
    );
  }
}

class _ChangeUserInfoWidget extends StatelessWidget {
  const _ChangeUserInfoWidget();

  @override
  Widget build(BuildContext context) {
    return ProfileCustomButton(
      iconData: Icons.person,
      onTap: () => onTap(context),
      buttonText: 'Change user information',
    );
  }

  void onTap(BuildContext context) {
    modal.showBarModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChangeUserinfo(),
    );
  }
}
