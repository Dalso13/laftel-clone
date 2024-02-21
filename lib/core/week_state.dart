enum WeekState {
  monday(kr: '월', data: 1),
  tuesday(kr: '화', data: 2),
  wednesday(kr: '수', data: 3),
  thursday(kr: '목', data: 4),
  friday(kr: '금', data: 5),
  saturday(kr: '토', data: 6),
  sunday(kr: '일', data: 0);

  final String kr;
  final int data;

  const WeekState({
    required this.kr,
    required this.data,
  });
}
