import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final _picker = ImagePicker();

  Future<String?> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(
          source: ImageSource.gallery, maxWidth: 200, maxHeight: 200);

      if (image == null) {
        return null;
      }

      final imageTemp = File(image.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('userProfileImage')
          .child('${DateTime.now()}.jpg');
      await ref.putFile(imageTemp);

      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error picking/uploading image: $e');
      return null;
    }
  }

  Future<String?> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }

    final imageTemp = File(image.path);
    final ref = FirebaseStorage.instance
        .ref()
        .child('userProfileImage')
        .child('${DateTime.now()}.jpg');
    await ref.putFile(imageTemp);

    final imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }
}
