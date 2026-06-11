import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:fc_app/utils/fortune_cookie.dart';

abstract class FortuneRepository {
  Future<Fortune> getFortune();
}

class ApiFortuneRepository implements FortuneRepository {
  final FortuneCookieModel model;
  ApiFortuneRepository(this.model);

  @override
  Future<Fortune> getFortune() async {
    // Your existing API call logic here
    // return await apiService.fetchFortune();
    try {
      final FortuneCookie cookie = await model.getFortuneCookie();
      return cookie.fortune;
    } catch (e) {
      // 3. Rethrow the error so the ViewModel can catch it and show a message to the user
      rethrow;
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
