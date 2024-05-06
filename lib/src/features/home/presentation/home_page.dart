// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_assignment/src/features/home/controller/home_page_controller.dart';
import 'package:flutter_assignment/src/features/home/model/card_model.dart';
import 'package:flutter_assignment/src/features/home/repository/home_page_repository.dart';
import 'package:flutter_assignment/src/resources/widgets/custom_app_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final controller = CardSwiperController();

  final homePageRepo = HomePageRepository();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  int? currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homePageController);
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Image.asset(
          "assets/icons/location_black.png",
          width: 28,
          height: 28,
        ),
        text1: "목이길어슬픈기린",
        text2: "님의 새로운",
        text3: "스팟",
        showtrailingIcon: true,
      ),
      body: SingleChildScrollView(
        child: currentindex == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "추천 드릴 친구들을 준비 중이에요",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "매일 새로운 친구들을 소개시켜드려요",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.78,
                    width: MediaQuery.of(context).size.width,
                    child: CardSwiper(
                      isLoop: false,
                      scale: 0.5,
                      allowedSwipeDirection: const AllowedSwipeDirection.only(
                        left: true,
                        down: true,
                      ),
                      controller: controller,
                      cardsCount: 2,
                      onSwipe: (previousIndex, currentIndex, direction) async {
                        setState(() {
                          currentindex = currentIndex;
                        });
                        return true;
                      },
                      cardBuilder: (context, index, _, __) {
                        final model = initializeCard(homeState, index);
                        return CardChild(
                          model: model,
                          homeState: homeState,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  CardModel initializeCard(HomePageController homeState, int index) {
    final model = CardModel(
      images: homePageRepo.getImages(),
      widgets: homePageRepo.getWidgets(),
    );
    homeState.mapIndexToCard(index, model);

    return model;
  }
}

class CardChild extends StatelessWidget {
  const CardChild({
    super.key,
    required this.model,
    required this.homeState,
  });

  final CardModel model;
  final HomePageController homeState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      alignment: Alignment.center,
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.2],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Kcolors.borderColor,
        ),
        image: DecorationImage(
            image: AssetImage(
              model.images[homeState.currentIndex],
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          GestureRow(homeState: homeState, model: model),
          CardDataContainer(model: model, homeState: homeState),
        ],
      ),
    );
  }
}

class CardDataContainer extends StatelessWidget {
  const CardDataContainer({
    super.key,
    required this.model,
    required this.homeState,
  });

  final CardModel model;
  final HomePageController homeState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageBars(model: model, homeState: homeState),
          model.widgets[homeState.currentIndex],
        ],
      ),
    );
  }
}

class GestureRow extends StatelessWidget {
  const GestureRow({
    super.key,
    required this.homeState,
    required this.model,
  });

  final HomePageController homeState;
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  if (homeState.currentIndex > 0) {
                    homeState.changeIndex = homeState.currentIndex - 1;
                  }
                },
                child: const SizedBox(
                  width: 100,
                  height: 100,
                )),
            InkWell(
                onTap: () {
                  if (homeState.currentIndex < model.images.length - 1) {
                    homeState.changeIndex = homeState.currentIndex + 1;
                  }
                },
                child: const SizedBox(
                  width: 100,
                  height: 100,
                )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageBars extends StatelessWidget {
  const ImageBars({
    super.key,
    required this.model,
    required this.homeState,
  });

  final CardModel model;
  final HomePageController homeState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 4,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: model.images.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ImageBar(isSelected: index == homeState.currentIndex);
          }),
    );
  }
}

class ImageBar extends StatelessWidget {
  const ImageBar({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Kcolors.darkPink : Kcolors.primary,
      ),
    );
  }
}
