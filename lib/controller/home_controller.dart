import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hyperhire_assignment/generated/assets.dart';
import 'package:hyperhire_assignment/model/product_model.dart';

class HomeController extends GetxController {
  //// Image Slider ////
  final List<String> images = [
    Assets.imagesSlider1,
    Assets.imagesSlider2,
    Assets.imagesSlider3,
    Assets.imagesSlider4,
  ];

  final RxInt currentIndex = 0.obs;

  void onItemChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  //// Product List ////
  final List<ProductModel> productList = [
    ProductModel(
      image: Assets.imagesProduct1,
      rank: 1,
      title: "LG전자 스탠바이미 27ART10AKPL (스탠",
      description: ["화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다.", "스탠바이미는 사랑입니다!️"],
      ratingAverage: 4.89,
      ratingCount: 216,
      tags: ["LG전자", "편리성"],
    ),
    ProductModel(
      image: Assets.imagesProduct2,
      rank: 2,
      title: "LG전자  울트라HD 75UP8300KNA (스탠드)",
      description: ["화면 잘 나오고... 리모컨 기능 좋습니다.", "넷플 아마존 등 버튼하나로 바로 접속 되고디스플레이는 액정문제 없어보이고소리는 살짝 약간 감이 있으나 ^^; 시끄러울까봐 그냥 블루투스 헤드폰 구매 예정이라 문제는 없네요. 아주 만족입니다!!"],
      ratingAverage: 4.36,
      ratingCount: 136,
      tags: ["LG전자", "고화질"],
    ),
    ProductModel(
      image: Assets.imagesProduct3,
      rank: 3,
      title: "라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)",
      description: ["반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면", "중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어"],
      ratingAverage: 3.98,
      ratingCount: 98,
      tags: ["라익미", "가성비"],
    ),
  ];

  /// User List
  final List<String> userProfileImageList = [
    Assets.imagesUser1,
    Assets.imagesUser2,
    Assets.imagesUser3,
    Assets.imagesUser4,
    Assets.imagesUser5,
    Assets.imagesUser6,
    Assets.imagesUser7,
    Assets.imagesUser8,
    Assets.imagesUser9,
    Assets.imagesUser10,
  ];
}
