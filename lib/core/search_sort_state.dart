enum SearchSortState {
  rank(idx : 0, kr : '라프텔 랭킹 순'),
  name(idx : 1, kr : '이름 순'),
  newAnime(idx : 2, kr : '최신 순'),
  many(idx : 3, kr : '평가 많은 순'),
  rating(idx : 4, kr : '평점 높은 순');

  final int idx;
  final String kr;

  const SearchSortState({
    required this.idx,
    required this.kr
  });
}