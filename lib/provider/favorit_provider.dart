import 'package:flutter/material.dart';

class FavoritProvider extends ChangeNotifier {
  List<String> _words = [];
  List<String> get Words => _words;

  CheckFavorite(String word) {
    if (isExist(word)) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  isExist(String word) {
    return Words.contains(word);
  }

  cleareFavorite() {
    _words.clear();
    notifyListeners();
  }
}
