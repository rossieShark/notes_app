import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';

class ImageBloc extends Bloc<ImageBlocEvents, ImageBlocState> {
  final ImagePickerService _imagePickerService;
  ImageBloc(this._imagePickerService) : super(ImageBlocState(image: null)) {
    on<PickAndUploadImageEvent>(_onPickAndUploadImageEvent);
    on<PickfromCamAndUploadImageEvent>(_onPickfromCamAndUploadImageEvent);
  }

  void _onPickAndUploadImageEvent(
      PickAndUploadImageEvent event, Emitter<ImageBlocState> emit) async {
    final imageUrl = await _imagePickerService.pickImageFromGallery();
    print(imageUrl);
    if (imageUrl != null) {
      emit(ImageBlocState(image: imageUrl));
    }
  }

  void _onPickfromCamAndUploadImageEvent(PickfromCamAndUploadImageEvent event,
      Emitter<ImageBlocState> emit) async {
    final imageUrl = await _imagePickerService.pickImageFromCamera();
    if (imageUrl != null) {
      emit(ImageBlocState(image: imageUrl));
    }
  }
}
