import 'dart:io';

import 'package:fc_app/fortune_cookie.dart';
import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:flutter/material.dart';

class FortuneCookieViewModel extends ChangeNotifier {
  final FortuneCookieModel model;
  FortuneCookie? cookie;
  Exception? error;
  bool isLoading = false;

  FortuneCookieViewModel(this.model) {
    fetchCookie();
  }

  Future<void> fetchCookie() async {
    isLoading = true;
    notifyListeners();

    try {
      cookie = await model.getFortuneCookie();
      //   print('Article loaded: ${cookie!.fortune.type}');
      error = null;
    } on HttpException catch (e) {
      error = e;
      cookie = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
