enum PopularAnimeState {
  realTime(value : '실시간'),
  week(value : '이번주'),
  quarter(value : '분기'),
  allTime(value : '역대');

  final String value;
  const PopularAnimeState({required this.value});
}