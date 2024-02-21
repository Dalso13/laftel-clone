enum PopularAnimeState {
  realTime(kr : '실시간'),
  week(kr : '이번주'),
  quarter(kr : '분기'),
  allTime(kr : '역대');

  final String kr;
  const PopularAnimeState({required this.kr});
}