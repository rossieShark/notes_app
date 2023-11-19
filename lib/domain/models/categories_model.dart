// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoriesModel {
  final String category;
  final String image;
  CategoriesModel({
    required this.category,
    required this.image,
  });

  CategoriesModel copyWith({
    String? category,
    String? image,
  }) {
    return CategoriesModel(
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  @override
  String toString() => 'CategoriesModel(category: $category, image: $image)';

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;

    return other.category == category && other.image == image;
  }

  @override
  int get hashCode => category.hashCode ^ image.hashCode;
}
