import 'package:flutter/material.dart';

import '../../../../core/week_state.dart';

class WeekChangeItem extends StatelessWidget {
  final WeekState _currentWeek;
  final void Function(WeekState week) _onSelected;

  const WeekChangeItem({
    super.key,
    required WeekState currentWeek,
    required void Function(WeekState week) onSelected,
  })  : _currentWeek = currentWeek,
        _onSelected = onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: WeekState.values
              .map(
                (e) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: ChoiceChip(
                labelPadding: const EdgeInsets.all(4.0),
                label: Text(e.kr),
                labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                backgroundColor: Colors.grey[400],
                selectedColor: Colors.deepPurple[400],
                selected: _currentWeek == e,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                onSelected: (bool value) {
                  _onSelected(e);
                },
                showCheckmark: false,
                shape: const StadiumBorder(
                    side: BorderSide(style: BorderStyle.none)),
              ),
            ),
          )
              .toList()),
    );
  }
}
