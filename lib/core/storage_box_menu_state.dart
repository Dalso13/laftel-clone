enum StorageBoxMenuState {
  recent(idx : 0, kr : '최근 본'),
  want(idx : 1, kr : '보고싶다'),
  download(idx : 2, kr : '다운로드'),
  bought(idx : 3, kr : '구매한'),
  relay(idx : 4, kr : '정주행');

  final int idx;
  final String kr;

  const StorageBoxMenuState({
    required this.idx,
    required this.kr
  });
}