import 'package:coffe_shop/models/coffee_model.dart';
import 'package:flutter/material.dart';

List<Coffee> dummyCoffee = [
  Coffee(
    id: '1',
    name: '아메리카노',
    type: CoffeeType.espresso,
    imageUrl: 'img/americano_espresso.jpg',
    rating: 4.3,
    participants: 1200,
    description: '에스프레소에 뜨거운 물을 가득 채워 부드럽고 깔끔한 끝맛을 선사하는 기본 커피. '
        '산미와 바디감의 균형이 좋으며, 다양한 원두의 개성을 경험하기에 적합한 선택입니다.',
    price: 4300,
  ),
  Coffee(
    id: '2',
    name: '아몬드 에스프레소',
    type: CoffeeType.espresso,
    imageUrl: 'img/amond_espresso.jpg',
    rating: 4.7,
    participants: 980,
    description: '진한 에스프레소에 고소한 아몬드 향이 더해진 커피. '
        '부드러운 아몬드의 단맛과 에스프레소의 강렬한 풍미가 조화를 이루어, '
        '고소함과 진한 맛을 동시에 즐길 수 있는 음료입니다.',
    price: 4900,
  ),
  Coffee(
    id: '3',
    name: '카푸치노',
    type: CoffeeType.espresso,
    imageUrl: 'img/cappuchino.jpg',
    rating: 4.6,
    participants: 850,
    description: '에스프레소와 스팀 밀크, 풍성한 우유 거품이 만나 크리미한 질감을 자랑하는 커피. '
        '우유 거품의 부드러운 식감과 에스프레소의 깊은 풍미가 어우러져, '
        '고소하면서도 부드러운 음미가 가능합니다.',
    price: 5100,
  ),
  Coffee(
    id: '4',
    name: '콜드 브루',
    type: CoffeeType.coldbrew,
    imageUrl: 'img/coldbrew.jpg',
    rating: 4.8,
    participants: 760,
    description: '12시간 이상 천천히 저온에서 추출한 커피로, '
        '일반적인 커피보다 산미가 적고 부드러운 단맛이 특징입니다. '
        '고급 원두의 은은한 향과 깊은 바디감을 느낄 수 있는 스페셜티 커피입니다.',
    price: 5500,
  ),
  Coffee(
    id: '5',
    name: '아이스 커피',
    type: CoffeeType.brewdCoffee,
    imageUrl: 'img/icecoffee_brewd.jpg',
    rating: 4.4,
    participants: 690,
    description: '신선하게 내린 커피를 얼음과 함께 제공하여 시원하면서도 깔끔한 맛이 돋보이는 음료. '
        '적절한 산미와 고소한 끝맛이 어우러져 가볍게 즐기기 좋은 커피입니다.',
    price: 4800,
  ),
  Coffee(
    id: '6',
    name: '콘 에스프레소',
    type: CoffeeType.espresso,
    imageUrl: 'img/corn_espresso.jpg',
    rating: 4.5,
    participants: 920,
    description: '고소한 옥수수 향이 은은하게 퍼지는 독특한 에스프레소. '
        '옥수수의 자연스러운 단맛과 에스프레소의 씁쓸한 풍미가 조화를 이루어 '
        '한층 더 부드럽고 고소한 맛을 느낄 수 있습니다.',
    price: 5200,
  ),
  Coffee(
    id: '7',
    name: '크림 콜드브루',
    type: CoffeeType.coldbrew,
    imageUrl: 'img/cream_coldbrew.jpg',
    rating: 4.9,
    participants: 420,
    description: '콜드브루 위에 부드러운 크림을 얹어 깊고 달콤한 맛을 더한 커피. '
        '고소한 크림과 묵직한 콜드브루의 조합이 우아한 단맛을 선사하며, '
        '부드러운 목넘김이 특징입니다.',
    price: 6200,
  ),
  Coffee(
    id: '8',
    name: '돌체 콜드브루',
    type: CoffeeType.coldbrew,
    imageUrl: 'img/dolche_coldbrew.jpg',
    rating: 4.7,
    participants: 350,
    description: '콜드브루에 연유를 더해 달콤함을 강조한 커피. '
        '부드러운 단맛과 깊은 커피 풍미가 조화를 이루며, '
        '마치 디저트를 즐기는 듯한 기분을 선사하는 특별한 음료입니다.',
    price: 6300,
  ),
  Coffee(
    id: '9',
    name: '헤이즐넛 에스프레소',
    type: CoffeeType.espresso,
    imageUrl: 'img/heyzlnult_espresso.jpg',
    rating: 4.3,
    participants: 280,
    description: '에스프레소에 헤이즐넛 향을 더해 고소함과 달콤함을 동시에 느낄 수 있는 커피. '
        '깊고 부드러운 커피 향과 너티한 헤이즐넛의 풍미가 입안을 감싸줍니다.',
    price: 5100,
  ),
  Coffee(
    id: '10',
    name: '흑임자 콜드브루',
    type: CoffeeType.coldbrew,
    imageUrl: 'img/huk_coldbrew.jpg',
    rating: 4.8,
    participants: 520,
    description: '고소한 흑임자(검은깨)의 풍미가 더해진 콜드브루. '
        '달지 않으면서도 깊고 은은한 고소함이 남는 독특한 음료로, '
        '담백한 맛을 선호하는 분들에게 추천합니다.',
    price: 5900,
  ),
  Coffee(
    id: '11',
    name: '프라푸치노',
    type: CoffeeType.frappuccino,
    imageUrl: 'img/prapuchino.jpg',
    rating: 4.6,
    participants: 730,
    description: '에스프레소, 우유, 얼음을 블렌딩하여 달콤하고 시원한 맛을 제공하는 커피. '
        '묵직한 바디감과 크리미한 질감이 특징으로, 디저트와 함께 즐기기 좋은 음료입니다.',
    price: 6100,
  ),
  Coffee(
    id: '12',
    name: '딸기 프라푸치노',
    type: CoffeeType.frappuccino,
    imageUrl: 'img/straw_blen.jpg',
    rating: 4.7,
    participants: 620,
    description: '신선한 딸기와 우유를 블렌딩하여 상큼하고 달콤한 맛이 강조된 음료. '
        '딸기의 자연스러운 과일 향이 우유와 조화를 이루어 부드러운 목넘김을 선사합니다.',
    price: 6300,
  ),
  Coffee(
    id: '13',
    name: '자바칩 프라푸치노',
    type: CoffeeType.frappuccino,
    imageUrl: 'img/zava_fra.jpg',
    rating: 4.6,
    participants: 680,
    description: '진한 초콜릿 시럽과 에스프레소가 조화를 이루며, '
        '초콜릿 칩이 씹히는 재미까지 더한 프라푸치노. '
        '달콤하고 크리미한 맛이 특징이며, 디저트처럼 즐기기 좋은 음료입니다.',
    price: 6100,
  ),
  Coffee(
    id: '14',
    name: '레몬 블렌디드',
    type: CoffeeType.blended,
    imageUrl: 'img/lemon_blen.jpg',
    rating: 4.5,
    participants: 450,
    description: '신선한 레몬 과즙과 얼음을 블렌딩하여 청량한 맛을 강조한 음료. '
        '달지 않고 상큼한 맛이 강해 무더운 여름에 특히 인기 있는 메뉴입니다.',
    price: 5800,
  ),
  Coffee(
    id: '15',
    name: '망고 블렌디드',
    type: CoffeeType.blended,
    imageUrl: 'img/mango_blen.jpg',
    rating: 4.7,
    participants: 520,
    description: '잘 익은 망고를 듬뿍 넣어 만든 블렌디드 음료. '
        '부드러운 질감과 풍부한 열대 과일 향이 특징이며, '
        '망고 본연의 자연스러운 단맛을 느낄 수 있습니다.',
    price: 6000,
  ),
  Coffee(
    id: '16',
    name: '딸기 블렌디드',
    type: CoffeeType.blended,
    imageUrl: 'img/straw_blen.jpg',
    rating: 4.6,
    participants: 480,
    description: '신선한 딸기와 얼음을 함께 블렌딩하여 '
        '상큼하고 시원한 맛이 강조된 과일 음료. '
        '딸기 본연의 달콤한 풍미가 잘 살아 있으며, '
        '여름철 인기 음료 중 하나입니다.',
    price: 5900,
  ),
  Coffee(
    id: '17',
    name: '캐모마일 티',
    type: CoffeeType.tea,
    imageUrl: 'img/camo_tea.jpg',
    rating: 4.9,
    participants: 680,
    description: '향긋한 캐모마일 꽃잎을 우려내어 만든 허브 티. '
        '부드러운 꽃향기와 은은한 단맛이 특징이며, '
        '심신을 편안하게 해주는 효과가 있어 자기 전 마시기 좋은 차입니다.',
    price: 5700,
  ),
  Coffee(
    id: '18',
    name: '얼그레이 티',
    type: CoffeeType.tea,
    imageUrl: 'img/grey_tea.jpg',
    rating: 4.8,
    participants: 710,
    description: '고급 홍차 잎에 베르가못 오일을 더해 우아한 향을 가진 클래식한 홍차. '
        '깊고 진한 풍미와 향긋한 감귤류 향이 어우러져 '
        '기품 있는 차 문화를 경험할 수 있습니다.',
    price: 5800,
  ),
  Coffee(
    id: '19',
    name: '말차 티',
    type: CoffeeType.tea,
    imageUrl: 'img/malch_tea.jpg',
    rating: 4.6,
    participants: 590,
    description: '고급 말차 분말을 사용하여 우려낸 진한 녹차. '
        '부드러운 식감과 쌉싸름한 맛이 특징이며, '
        '녹차 특유의 깊고 풍부한 풍미를 즐길 수 있습니다.',
    price: 6200,
  ),
  Coffee(
    id: '20',
    name: '민트 티',
    type: CoffeeType.tea,
    imageUrl: 'img/mint_tea.jpg',
    rating: 4.7,
    participants: 530,
    description: '상쾌한 민트 향이 입안을 가득 채우며, '
        '마시는 순간 깔끔한 끝맛을 자랑하는 허브 티. '
        '기름진 음식 후에 마시면 특히 개운함을 느낄 수 있는 차입니다.',
    price: 5900,
  ),
];
