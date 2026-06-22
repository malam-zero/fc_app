import 'dart:convert';

import 'package:fc_app/utils/exceptions.dart';
import 'package:fc_app/utils/fortune_cookie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FortuneApiService {
  Future<FortuneCookie> getFortuneCookie() async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception(
        'API_KEY is not configured. Please add it to your .env file.',
      );
    }

    final uri = Uri.https('api.apiverve.com', '/v1/fortunecookie');
    final response = await http.get(uri, headers: {'x-api-key': apiKey});

    if (response.statusCode != 200) {
      throw ServerException(
        'Failed to fetch fortune from server: ${response.statusCode}',
      );
    }

    final jsonMap = jsonDecode(response.body) as Map<String, Object?>;
    return FortuneCookie.fromJson(jsonMap);
  }
}
