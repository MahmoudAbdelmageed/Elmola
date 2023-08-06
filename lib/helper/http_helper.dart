
import 'package:http/http.dart' as http;


class HttpHelper {
  static Future<http.Response> postData(
      {required String urlPath, dynamic body, dynamic header}) async {
    final http.Response response = await http.post(
        Uri.parse("$urlPath"),
        headers: header,
        body: body);
    return response;
  }

  static Future<http.Response> getData(
      {required String urlPath,dynamic header}) async {
    final http.Response response = await http.get(
      Uri.parse("$urlPath"),
      headers: header,
    );
    return response;
  }



}
