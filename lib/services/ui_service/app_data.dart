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
}
