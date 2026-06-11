import 'package:fc_app/config.dart';
import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:fc_app/repositories/fortune_repository.dart';
import 'package:fc_app/utils/fortune_cookie.dart';
import 'package:flutter/material.dart';

class FortuneCookieViewModel extends ChangeNotifier {
  final FortuneCookieModel model;
  Fortune? fortune;
  Exception? error;
  bool isLoading = false;
  late FortuneRepository _repository;

  FortuneCookieViewModel(this.model) {
    if (AppConfig.useMockData) {
      _repository = MockFortuneRepository();
    } else {
      _repository = ApiFortuneRepository(model);
    }
    // fetchFortune();
  }

  //   Fortune? get fortune => cookie?.fortune;

  Future<void> fetchFortune() async {
    isLoading = true;
    error = null;
    notifyListeners(); // Notify that loading has started

    try {
      // 3. Assign the result to the class member 'fortune'
      fortune = await _repository.getFortune();
    } catch (e) {
      // 4. Handle errors
      error = Exception(e.toString());
    } finally {
      // 5. Always stop loading and notify listeners
      isLoading = false;
      notifyListeners();
    }
  }
}
