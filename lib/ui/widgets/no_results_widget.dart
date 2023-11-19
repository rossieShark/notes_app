import 'package:flutter/material.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No notes yet',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
