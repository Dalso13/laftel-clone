enum DetailAnimeMenuState {
  episode(idx : 0, kr : '에피소드'),
  comments(idx : 1, kr : '사용자 평'),
  other(idx : 2, kr : '비슷한 작품');

  final int idx;
  final String kr;

  const DetailAnimeMenuState({
    required this.idx,
    required this.kr
  });
}