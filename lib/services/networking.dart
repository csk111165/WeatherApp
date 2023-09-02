import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  // return Future since the result of get is not available on the fly
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    
    } else {
      // print("Request failed with status: ${response.body}");
      print(response.body);
    }
  }
}
