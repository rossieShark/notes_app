import 'package:flutter/material.dart';

import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/models_index.dart';
import 'package:notes_app/services/services_index.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    final categories = AppData().categories;
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => _onTap(context, categories, index),
                child: _CategoryCard(
                  text: categories[index].category,
                  isTapped: selectedCategoryIndex == index,
                ));
          },
        ),
      ],
    );
  }

  void _onTap(
      BuildContext context, List<CategoriesModel> categories, int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
    context.read<CategoriesBloc>().add(SaveBlocEvent(categories[index]));
  }
}

class _CategoryCard extends StatelessWidget {
  final String text;
  final bool isTapped;
  const _CategoryCard({
    Key? key,
    required this.text,
    required this.isTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: isTapped ? AppColors.yellow : AppColors.lightPink,
        width: MediaQuery.of(context).size.width / 3 - 16 - 4,
        height: 35,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: AppColors.redBrown, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
