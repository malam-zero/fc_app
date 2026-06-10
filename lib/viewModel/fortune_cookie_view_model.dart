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

  Fortune? get fortune => cookie?.fortune;

  Future<void> fetchCookie() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      cookie = await model.getFortuneCookie();
    //   print('Article loaded: ${cookie!.fortune.type}');
      error = null;
    } on HttpException catch (e) {
      error = e;
      cookie = null;
    } catch (e, st) {
      error = Exception('$e');
      cookie = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
