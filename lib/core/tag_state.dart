// 원래라면 DB로 처리하겠지만 그냥 약식으로 처리

enum TagCategoryState {
  genre(kr: '장르', tagNum: 0),
  tag(kr: '태그', tagNum: 1),
  year(kr: '연도', tagNum: 2),
  broadcast(kr: '방영', tagNum: 3),
  release(kr: '출시타입', tagNum: 4),
  brand(kr: '브랜드', tagNum: 5);

  final String kr;
  final int tagNum;


  const TagCategoryState({
    required this.kr,
    required this.tagNum
  });
}


enum TagState {
  // 장르 태그 너무많아서 조금하고 나중에 추가예정
  bl(kr: 'BL', tagNum: 0),
  gl(kr: 'GL 백합', tagNum: 0),
  sf(kr: 'SF', tagNum: 0),
  gag(kr: '개그', tagNum: 0),
  horror(kr: '공포', tagNum: 0),
  drama(kr: '드라마', tagNum: 0),
  romance(kr: '로맨스', tagNum: 0),
  adventure(kr: '모험', tagNum: 0),
  wuxia(kr: '무협', tagNum: 0),
  mystery(kr: '미스터리', tagNum: 0),
  crime(kr: '범죄', tagNum: 0),
  thrill(kr: '스릴러', tagNum: 0),
  history(kr: '시대물', tagNum: 0),
  child(kr: '아동', tagNum: 0),
  idol(kr: '아이돌', tagNum: 0),
  fantasy(kr: '판타지', tagNum: 0),

  // 태그 역시 마찬가지로
  family(kr: '가족', tagNum: 1),
  moving(kr: '감동', tagNum: 1),
  game(kr: '게임', tagNum: 1),
  animal(kr: '동물', tagNum: 1),
  east(kr: '동양풍', tagNum: 1),
  brain(kr: '두뇌싸움', tagNum: 1),
  robot(kr: '로봇', tagNum: 1),
  loop(kr: '루프물', tagNum: 1),
  magical(kr: '마법소녀', tagNum: 1),
  battle(kr: '배틀', tagNum: 1),

  // 연도 역시 마찬가지로
  twentyFourQ2(kr: '2024년 2분기', tagNum: 2),
  twentyFourQ1(kr: '2024년 1분기', tagNum: 2),
  twentyThreeQ4(kr: '2023년 4분기', tagNum: 2),
  twentyThreeQ3(kr: '2023년 3분기', tagNum: 2),
  twentyThreeQ2(kr: '2023년 2분기', tagNum: 2),
  twentyThreeQ1(kr: '2023년 1분기', tagNum: 2),
  twentyTwo(kr: '2022년', tagNum: 2),
  twentyOne(kr: '2021년', tagNum: 2),
  twenty(kr: '2020년', tagNum: 2),
  nineteen(kr: '2019년', tagNum: 2),
  eighteen(kr: '2018년', tagNum: 2),
  seventeen(kr: '2017년', tagNum: 2),

  onAir(kr: '방영중', tagNum: 3),
  end(kr: '완결', tagNum: 3),

  tva(kr: 'TVA', tagNum: 4),
  cinema(kr: '극장판', tagNum: 4),
  ova(kr: 'OVA', tagNum: 4),

  animaxPlus(kr: '애니맥스 플러스', tagNum: 5),
  aniplus(kr: '애니플러스', tagNum: 5),
  ktAlpha(kr: 'kt alpha', tagNum: 5),
  daewon(kr: '대원', tagNum: 5),
  brandOther(kr: '기타', tagNum: 5);


  final String kr;
  final int tagNum;


  const TagState({
    required this.kr,
    required this.tagNum
  });
}
