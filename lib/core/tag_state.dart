// 원래라면 DB로 처리하겠지만 그냥 약식으로 처리

enum TagCategoryState {
  genre(kr: '장르', cateNum: 0),
  tag(kr: '태그', cateNum: 1),
  year(kr: '연도', cateNum: 2),
  broadcast(kr: '방영', cateNum: 3),
  release(kr: '출시타입', cateNum: 4),
  brand(kr: '브랜드', cateNum: 5);

  final String kr;
  final int cateNum;


  const TagCategoryState({
    required this.kr,
    required this.cateNum
  });
}


enum TagState {
  // 장르 태그 너무많아서 조금하고 나중에 추가예정
  bl(kr: 'BL', cateNum: 0),
  gl(kr: 'GL 백합', cateNum: 0),
  sf(kr: 'SF', cateNum: 0),
  gag(kr: '개그', cateNum: 0),
  horror(kr: '공포', cateNum: 0),
  drama(kr: '드라마', cateNum: 0),
  romance(kr: '로맨스', cateNum: 0),
  adventure(kr: '모험', cateNum: 0),
  wuxia(kr: '무협', cateNum: 0),
  mystery(kr: '미스터리', cateNum: 0),
  crime(kr: '범죄', cateNum: 0),
  thrill(kr: '스릴러', cateNum: 0),
  history(kr: '시대물', cateNum: 0),
  child(kr: '아동', cateNum: 0),
  idol(kr: '아이돌', cateNum: 0),
  fantasy(kr: '판타지', cateNum: 0),

  // 태그 역시 마찬가지로
  family(kr: '가족', cateNum: 1),
  moving(kr: '감동', cateNum: 1),
  game(kr: '게임', cateNum: 1),
  animal(kr: '동물', cateNum: 1),
  east(kr: '동양풍', cateNum: 1),
  brain(kr: '두뇌싸움', cateNum: 1),
  robot(kr: '로봇', cateNum: 1),
  loop(kr: '루프물', cateNum: 1),
  magical(kr: '마법소녀', cateNum: 1),
  battle(kr: '배틀', cateNum: 1),

  // 연도 역시 마찬가지로
  twentyFourQ2(kr: '2024년 2분기', cateNum: 1),
  twentyFourQ1(kr: '2024년 1분기', cateNum: 1),
  twentyThreeQ4(kr: '2023년 4분기', cateNum: 1),
  twentyThreeQ3(kr: '2023년 3분기', cateNum: 1),
  twentyThreeQ2(kr: '2023년 2분기', cateNum: 1),
  twentyThreeQ1(kr: '2023년 1분기', cateNum: 1),
  twentyTwo(kr: '2022년', cateNum: 1),
  twentyOne(kr: '2021년', cateNum: 1),
  twenty(kr: '2020년', cateNum: 1),
  nineteen(kr: '2019년', cateNum: 1),
  eighteen(kr: '2018년', cateNum: 1),
  seventeen(kr: '2017년', cateNum: 1),

  onAir(kr: '방영중', cateNum: 2),
  end(kr: '완결', cateNum: 2),

  tva(kr: 'TVA', cateNum: 3),
  cinema(kr: '극장판', cateNum: 3),
  ova(kr: 'OVA', cateNum: 3),

  animaxPlus(kr: '애니맥스 플러스', cateNum: 4),
  aniplus(kr: '애니플러스', cateNum: 4),
  ktAlpha(kr: 'kt alpha', cateNum: 4),
  daewon(kr: '대원', cateNum: 4),
  brandOther(kr: '기타', cateNum: 4);


  final String kr;
  final int cateNum;


  const TagState({
    required this.kr,
    required this.cateNum
  });
}
