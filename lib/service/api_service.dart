import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api-key/api_constants.dart';

class ApiService {
  // send message and get answers
  static Future<String> sendMessageToChatGPT({
    required String message,
    required String modelId,
    required bool isText,
  }) async {
    if (isText) {
      // generate a text response
      try {
        var response = await http.post(Uri.parse('$baseUrl/chat/completions'),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $chatGPTApiKey"
            },
            body: jsonEncode({
              "model": modelId,
              "messages": [
                {"role": "user", "content": message}
              ]
            }));

        Map jsonResponse = jsonDecode(response.body);
        if (jsonResponse['error'] != null) {}
        String answer = '';
        return answer;
      } catch (e) {
        rethrow;
      }
    } else {
      // generate an image response
      try {
        String imageUrl = '';
        return imageUrl;
      } catch (e) {
        rethrow;
      }
    }
  }
}
