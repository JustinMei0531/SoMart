import "dart:async";
import "dart:convert";
import "package:http/http.dart" as http;

class HttpService {
  HttpService();

  // Get Request
  Future<http.Response> getRequest({
    required String URL, required String token
}) async{
  try{
    var response = await http.get(
      Uri.parse(URL),
      headers: {
        "Content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Accept": "*/*",
        "Access-Origin-Allow-Methods": "GET, DELETE, HEAD, OPTIONS, POST",
        "Authorization": "Bearer $token"
      },

    );
    return response;
  }
  catch (e){
    throw Exception("Failed to send GET request to server: $e");
  }


  }

  // Post request
  Future<http.Response> postRequest(
      {required String URL, required Map<String, dynamic> body, String? token}) async {
    try {
      var response = await http.post(Uri.parse(URL),
          headers: {
            "Content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Accept": "*/*",
            "Access-Origin-Allow-Methods": "GET, DELETE, HEAD, OPTIONS, POST",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode(body));
      return response;
    } catch (e) {
      throw Exception("Failed to send POST request to server: $e");
    }
  }

  // Put request
  Future<http.Response> putRequest(
      {required String URL,
      required Map<String, dynamic> body,
      required String token}) async {
    try {
      var response = await http.put(Uri.parse(URL),
          headers: {
            "Content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Accept": "*/*",
            "Access-Origin-Allow-Methods": "GET, DELETE, HEAD, OPTIONS, POST",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode(body));
      return response;
    } catch (e) {
      throw Exception("Failed to send PUT request to server: $e");
    }
  }
}
