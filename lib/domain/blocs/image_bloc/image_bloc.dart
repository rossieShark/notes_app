import 'package:logging/logging.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/logger.dart';
import 'package:notes_app/services/services_index.dart';

class ImageBloc extends Bloc<ImageBlocEvents, ImageBlocState> {
  final ImagePickerService _imagePickerService;
  final Logger _logger = getLogger('ImageBloc');
  ImageBloc(this._imagePickerService) : super(ImageBlocState(image: null)) {
    on<PickAndUploadImageEvent>(_onPickAndUploadImageEvent);
    on<PickfromCamAndUploadImageEvent>(_onPickfromCamAndUploadImageEvent);
  }

  void _onPickAndUploadImageEvent(
      PickAndUploadImageEvent event, Emitter<ImageBlocState> emit) async {
    try {
      final imageUrl = await _imagePickerService.pickImageFromGallery();
      _logger.info(imageUrl);
      if (imageUrl != null) {
        emit(ImageBlocState(image: imageUrl));
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Error during picking photo from library: $error, stack trace: $stackTrace');
    }
  }

  void _onPickfromCamAndUploadImageEvent(PickfromCamAndUploadImageEvent event,
      Emitter<ImageBlocState> emit) async {
    try {
      final imageUrl = await _imagePickerService.pickImageFromCamera();
      if (imageUrl != null) {
        emit(ImageBlocState(image: imageUrl));
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Error during picking photo from cam: $error, stack trace: $stackTrace');
    }
  }
}
