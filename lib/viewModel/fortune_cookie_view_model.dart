import 'package:fc_app/repositories/fortune_repository.dart';
import 'package:fc_app/utils/fortune_cookie.dart';
import 'package:flutter/material.dart';

class FortuneViewModel extends ChangeNotifier {
  final FortuneRepository _repository;
  Fortune? _fortune;
  Fortune? get fortune => _fortune;

  Exception? _error;
  Exception? get error => _error;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FortuneViewModel(this._repository);

  Future<void> fetchFortune() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _fortune = await _repository.getFortune();
    } catch (e) {
      _error = e is Exception ? e : Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
