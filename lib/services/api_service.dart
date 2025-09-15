import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ApiService {
  static const String _baseUrl = 'https://minecraft-api.vercel.app/api';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse('$_baseUrl/items'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}

