import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/resources/resources.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class ChangeUserinfo extends StatefulWidget {
  const ChangeUserinfo({super.key});

  @override
  State<ChangeUserinfo> createState() => _ChangeUserinfoState();
}

class _ChangeUserinfoState extends State<ChangeUserinfo> {
  late TextEditingController _userNameTextController;
  FirebaseStorage storage = FirebaseStorage.instance;
  User? _user;
  String? imageUrl;
  ImagePickerService imagePickerService = ImagePickerService();

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageBlocState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: AppColors.yellow,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150 / 2),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: state.image != null
                            ? Image.network(
                                state.image!,
                                fit: BoxFit.cover,
                              )
                            : _user?.photoURL == null
                                ? Image.asset(
                                    AppImages.user,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(_user!.photoURL!,
                                    fit: BoxFit.cover),
                      ),
                    ),
                    const ChangePhotoWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _CreateChangeNameTextField(
                          userNameTextController: _userNameTextController),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        onPressed: () {
                          _saveData(state.image);
                          context.pop();
                        },
                        buttonText: 'Save')
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Future<void> uploadFile(String? image) async {
    if (image == null) return;
    await _user?.updatePhotoURL(image);
  }

  void _saveData(String? image) async {
    await uploadFile(image);

    if (_userNameTextController.text.isNotEmpty) {
      await _user?.updateDisplayName(_userNameTextController.text);
    }
  }
}

class _CreateChangeNameTextField extends StatelessWidget {
  const _CreateChangeNameTextField({
    required TextEditingController userNameTextController,
  }) : _userNameTextController = userNameTextController;

  final TextEditingController _userNameTextController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: AppColors.white,
        child: TextField(
          textAlign: TextAlign.center,
          controller: _userNameTextController,
          cursorColor: AppColors.green,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: 'Enter name',
            hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
