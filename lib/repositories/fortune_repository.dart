import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:fc_app/utils/exceptions.dart';
import 'package:fc_app/utils/fortune_cookie.dart';

abstract class FortuneRepository {
  Future<Fortune> getFortune();
}

class ApiFortuneRepository implements FortuneRepository {
  final FortuneApiService apiService;
  ApiFortuneRepository(this.apiService);

  @override
  Future<Fortune> getFortune() async {
    try {
      final FortuneCookie cookie = await apiService.getFortuneCookie();
      return cookie.fortune;
    } catch (e) {
      if (e is FortuneException) rethrow;
      throw UnexpectedException(e.toString());
    }
  }
}

class MockFortuneRepository implements FortuneRepository {
  @override
  Future<Fortune> getFortune() async {
    // Return a hardcoded fortune immediately
    return Fortune(
      fortune: "This is a mock fortune! No API credits used.",
      type: "mock",
    );
  }
}
