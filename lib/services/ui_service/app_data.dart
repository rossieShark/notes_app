import 'package:notes_app/domain/models/categories_model.dart';
import 'package:notes_app/resources/resources.dart';

class AppData {
  final List<CategoriesModel> _categories = [
    CategoriesModel(category: 'Work', image: AppImages.work),
    CategoriesModel(category: 'Home', image: AppImages.home),
    CategoriesModel(category: 'Study', image: AppImages.study),
    CategoriesModel(category: 'Personal', image: AppImages.user),
    CategoriesModel(category: 'Important', image: AppImages.star),
    CategoriesModel(category: 'Other', image: AppImages.other),
  ];

  final List<String> _filterList = [
    'All',
    'Work',
    'Home',
    'Study',
    'Personal',
    'Important',
    'Other',
  ];
  List<CategoriesModel> get categories => _categories;
  List<String> get filterList => _filterList;

  static const _titleTextField = 'Title';
  static const _dateTextField = 'Date';
  static const _startTimeTextField = 'Start Time';
  static const _endTimeTextField = 'End Time';
  static const _descriptionTextField = 'Description';

  String get titleTextField => _titleTextField;
  String get dateTextField => _dateTextField;
  String get startTimeTextField => _startTimeTextField;
  String get endTimeTextField => _endTimeTextField;
  String get descriptionTextField => _descriptionTextField;
}
