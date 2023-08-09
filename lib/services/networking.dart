import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  late dynamic decodedData;

  Future getData() async {
    final encoded = Uri.parse(url);

    final response = await http.get(encoded);
    print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
