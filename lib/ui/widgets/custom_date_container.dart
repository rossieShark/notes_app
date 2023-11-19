import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateContainer extends StatelessWidget {
  const CustomDateContainer({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          color: const Color.fromARGB(255, 251, 121, 173),
          width: 40,
          height: 100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DateWidget(index: index),
              const SizedBox(
                height: 4,
              ),
              _CreateNextDayWidget(index: index)
            ],
          )),
    );
  }
}

class _CreateNextDayWidget extends StatelessWidget {
  const _CreateNextDayWidget({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.d().format(DateTime.now().add(Duration(days: index))),
      style: const TextStyle(fontSize: 13, height: 0, color: Colors.white),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white))),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          DateFormat.E('en_US')
              .format(DateTime.now().add(Duration(days: index)))
              .toUpperCase(),
          style: const TextStyle(fontSize: 10, height: 0, color: Colors.white),
        ),
      ),
    );
  }
}
