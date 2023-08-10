import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  late dynamic decodedData;

  Future<dynamic> getData() async {
    final encoded = Uri.parse(url);

    final response = await http.get(encoded);
    debugPrint(response.body.toString());

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      debugPrint(response.statusCode.toString());
      return null;
    }
  }
}
