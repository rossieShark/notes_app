import 'package:flutter/material.dart';

import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/screens/screens_index.dart';

class WeekDay extends StatelessWidget {
  const WeekDay({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          color: AppColors.puce,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                _TodayDate(),
                SizedBox(
                  height: 30,
                ),
                _WeeksDays()
              ])),
    );
  }
}

class _WeeksDays extends StatefulWidget {
  const _WeeksDays();

  @override
  State<_WeeksDays> createState() => _WeeksDaysState();
}

class _WeeksDaysState extends State<_WeeksDays> {
  int? selectedCategoryIndex;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final currentDate = DateTime.now()
              .subtract(Duration(days: DateTime.now().weekday - 1 - index));
          final isToday = currentDate.day == DateTime.now().day;
          return GestureDetector(
            onTap: () => onTap(context, index),
            child: _GridViewContent(
                currentDate: currentDate,
                isToday: isSelected ? selectedCategoryIndex == index : isToday),
          );
        },
      ),
    );
  }

  void onTap(BuildContext context, int index) {
    setState(() {
      isSelected = true;
      selectedCategoryIndex = index;
    });
    context.read<CurrentDateBloc>().add(CanheCurrentDateEvent(index));
  }
}

class _GridViewContent extends StatelessWidget {
  const _GridViewContent({
    required this.currentDate,
    required this.isToday,
  });

  final DateTime currentDate;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(children: [
        Text(
          DateFormat('E').format(currentDate)[0],
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.lightPink),
        ),
        const SizedBox(
          height: 5,
        ),
        _CreateWeekDaysSection(isToday: isToday, currentDate: currentDate),
      ]),
    );
  }
}

class _CreateWeekDaysSection extends StatelessWidget {
  const _CreateWeekDaysSection({
    required this.isToday,
    required this.currentDate,
  });

  final bool isToday;
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 60,
        width: _calculateContainerWidth(context),
        color: isToday
            ? AppColors.white.withOpacity(0.8)
            : AppColors.white.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('d').format(currentDate),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ImagesGridView(currentDate: currentDate),
          ],
        ),
      ),
    );
  }

  double _calculateContainerWidth(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width - 16 * 2;
    const quantutyOfDays = 7;
    const paddingBetween = 8;

    return availableWidth / quantutyOfDays - paddingBetween;
  }
}

class _TodayDate extends StatelessWidget {
  const _TodayDate();

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().day}, ${DateTime.now().year} ',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
