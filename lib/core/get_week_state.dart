import 'package:laftel_clone/core/week_state.dart';

extension GetWeekState on DateTime {
  WeekState getWeekState() {
    switch (weekday) {

      case 0: return WeekState.sunday;
      case 1: return WeekState.monday;
      case 2: return WeekState.tuesday;
      case 3: return WeekState.wednesday;
      case 4: return WeekState.thursday;
      case 5: return WeekState.friday;
      case 6: return WeekState.saturday;
      default: return WeekState.sunday;
    }
  }
}