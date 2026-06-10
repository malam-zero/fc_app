import 'dart:convert';
import 'dart:io';

import 'package:fc_app/fortune_cookie.dart';
import 'package:http/http.dart' as http;

class FortuneCookieModel {
  Future<FortuneCookie> getFortuneCookie() async {
    final uri = Uri.https('api.apiverve.com', '/v1/fortunecookie');
    final response = await http.get(
      uri,
      headers: {'x-api-key': 'apv_f5fcbea6-aee6-4877-82f4-f38ad870bb71'},
    );

    if (response.statusCode != 200) {
      throw const HttpException('Failed to update resource');
    }

    final jsonMap = jsonDecode(response.body) as Map<String, Object?>;
    return FortuneCookie.fromJson(jsonMap);
  }
}
