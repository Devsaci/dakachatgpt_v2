import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
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
        if (jsonResponse['error'] != null) {
          throw HttpException(jsonResponse['error']['message']);
        }
        String answer = '';
        if (jsonResponse['choices'].length > 0) {
          if (kDebugMode) {
            print(
                'ANSWER : ${jsonResponse['choices'][0]['message']['content']}');
          }
          answer = jsonResponse['choices'][0]['message']['content'];
        }
        return answer;
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        rethrow;
      }
    } else {
      // generate an image response
      try {
        var response = await http.post(Uri.parse('$baseUrl/images/generations'),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $chatGPTApiKey"
            },
            body: jsonEncode({"prompt": message, "n": 2, "size": "1024x1024"}));
        Map jsonResponse = jsonDecode(response.body);
        if (jsonResponse['error'] != null) {
          throw HttpException(jsonResponse['error']['message']);
        }
        String imageUrl = '';
        if (jsonResponse['data'].length > 0) {
          if (kDebugMode) {
            print('ANSWER : ${jsonResponse['data'][0]['url']}');
          }
          imageUrl = jsonResponse['data'][0]['url'];
        }
        return imageUrl;
      } catch (e) {
        rethrow;
      }
    }
  }
}
