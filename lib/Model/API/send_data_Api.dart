import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> sendDataToAPI(String apiUrl, {String? authToken, required Map<String, dynamic> data}) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {

    return response.statusCode;
  } else {
    print('Failed to send data. Error code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.statusCode;
  }
}


