import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/makanan.dart';

const String apiUrl = 'https://api.jsonbin.io/v3/b/666cf042e41b4d34e403774a';
const Map<String, String> headers = {
  'Content-Type': 'application/json',
  'X-Master-Key': '\$2a\$10\$lwqttD8uRiE1uhg3uDbVRO4ViydPM/HqFEXgn90A.0rKx7Ez5TSRa',
};

Future<List<Makanan>> fetchMakanan() async {
  final response = await http.get(Uri.parse(apiUrl), headers: headers);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<dynamic> makananJson = data['record']['makanan'];
    return makananJson.map((json) => Makanan.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load makanan');
  }
}

Future<void> addMakanan(Makanan makanan) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: jsonEncode(makanan.toJson()),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to add makanan');
  }
}

Future<void> updateMakanan(Makanan makanan) async {
  final response = await http.put(
    Uri.parse('$apiUrl/${makanan.id}'),
    headers: headers,
    body: jsonEncode(makanan.toJson()),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update makanan');
  }
}

Future<void> deleteMakanan(int id) async {
  final response = await http.delete(
    Uri.parse('$apiUrl/$id'),
    headers: headers,
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to delete makanan');
  }
}
