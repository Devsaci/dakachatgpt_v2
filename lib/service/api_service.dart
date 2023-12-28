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
