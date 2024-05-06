import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/features/home/model/card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageController =
    ChangeNotifierProvider((ref) => HomePageController());

class HomePageController extends ChangeNotifier {
  final _cardIndexVsImages = {};

  int currentIndex = 0;

  Map get cardIndexVsImages => _cardIndexVsImages;

  void mapIndexToCard(int index, CardModel model) {
    _cardIndexVsImages[index] = model;
    notifyListeners();
  }

  set changeIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }
}
