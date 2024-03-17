enum StorageWantState {
  add(idx : 0, kr : '최근 넣은 순'),
  myReviewHigh(idx : 1, kr : '높게 평가한 순'),
  laftelRank(idx : 2, kr : '라프텔 랭킹 순'),
  name(idx : 3, kr : '이름 순'),
  date(idx : 4, kr : '최신 순'),
  reviewMany(idx : 5, kr : '평가 많은 순'),
  reviewHigh(idx : 7, kr : '평가 높은 순');

  final int idx;
  final String kr;

  const StorageWantState({
    required this.idx,
    required this.kr
  });
}
enum StorageBoughtState {
  bought(idx : 0, kr : '최근 구매 순'),
  view(idx : 1, kr : '최근 시청 순'),
  rank(idx : 2, kr : '최근 랭킹 순'),
  name(idx : 3, kr : '이름 순'),
  date(idx : 4, kr : '최신 순');

  final int idx;
  final String kr;

  const StorageBoughtState({
    required this.idx,
    required this.kr
  });
}
enum StorageRelayState {
  view(idx : 0, kr : '최근 시청 순'),
  rank(idx : 1, kr : '최근 랭킹 순'),
  name(idx : 2, kr : '이름 순'),
  date(idx : 3, kr : '최신 순');

  final int idx;
  final String kr;

  const StorageRelayState({
    required this.idx,
    required this.kr
  });
}