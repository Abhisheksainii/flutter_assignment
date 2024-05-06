import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/features/home/presentation/home_page.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';
import 'package:flutter_assignment/src/resources/widgets/card_data_widget.dart';
import 'package:flutter_assignment/src/resources/widgets/icon__number_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageRepository {
  List<String> getImages() {
    return [
      "assets/images/photo1.png",
      "assets/images/photo2.png",
      "assets/images/photo3.png",
      "assets/images/photo3.png",
      "assets/images/photo3.png",
    ];
  }

  List<Widget> getWidgets() {
    return const [
      FirstCardWidget(),
      SecondCardWidget(),
      ThirdCardWidget(),
      ThirdCardWidget(),
      ThirdCardWidget(),
    ];
  }
}

class ThirdCardWidget extends StatelessWidget {
  const ThirdCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardDataWidget(
        midWidget: RichText(
          text: const TextSpan(
            text: "잭과분홍콩나물",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 28,
            ),
            children: [
              TextSpan(
                text: '25',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        bottomWidget: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            CardDataWidgetContainer(
              emoji: "💖",
              text: "진지한 연애를 찾는 중",
              color: Kcolors.darkPink,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CardDataWidgetContainer(
                  emoji: "🍸",
                  text: "전혀 안 함",
                ),
                SizedBox(
                  width: 5,
                ),
                CardDataWidgetContainer(
                  emoji: "🚬",
                  text: "비흡연",
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            CardDataWidgetContainer(
              emoji: "💪",
              text: "매일 1시간 이상",
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CardDataWidgetContainer(
                  emoji: "🤝",
                  text: "만나는 걸 좋아함",
                ),
                SizedBox(
                  width: 5,
                ),
                CardDataWidgetContainer(
                  showIcon: false,
                  text: "INFP",
                ),
              ],
            ),
          ],
        ));
  }
}

class SecondCardWidget extends StatelessWidget {
  const SecondCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardDataWidget(
      midWidget: RichText(
        text: const TextSpan(
          text: "잭과분홍콩나물",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 28,
          ),
          children: [
            TextSpan(
              text: '25',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      bottomWidget: const SizedBox(
        width: 226,
        child: Text(
          '''서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다''',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 15,
          ),
          maxLines: 3,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class FirstCardWidget extends StatelessWidget {
  const FirstCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardDataWidget(
      midWidget: RichText(
        text: const TextSpan(
          text: "잭과분홍콩나물",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 28,
          ),
          children: [
            TextSpan(
              text: '25',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      bottomWidget: const Text(
        "서울 • 2km 거리에 있음",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}

class CardDataWidget extends StatelessWidget {
  const CardDataWidget(
      {super.key, required this.midWidget, required this.bottomWidget});
  final Widget midWidget;
  final Widget bottomWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IconNumberContainer(
              iconPath: "assets/icons/black_star.svg", number: "29,930"),
          const SizedBox(
            height: 5,
          ),
          midWidget,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomWidget,
              SvgPicture.asset(
                "assets/icons/blue_heart.svg",
                width: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
