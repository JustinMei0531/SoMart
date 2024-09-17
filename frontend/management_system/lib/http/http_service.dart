import "dart:async";
import "dart:convert";
import "package:http/http.dart" as http;

class HttpService {
  HttpService();

  // Post request
  Future<http.Response> postRequest(
      {required String URL, required Map<String, dynamic> body}) async {
    try {
      http.Response response = await http.post(Uri.parse(URL),
          headers: {
            "Content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Accept": "*/*",
            "Access-Origin-Allow-Methods": "GET, DELETE, HEAD, OPTIONS, POST"
          },
          body: jsonEncode(body));
      return response;
    } catch (e) {
      throw Exception("Failed to send POST request to server: $e");
    }
  }
}
