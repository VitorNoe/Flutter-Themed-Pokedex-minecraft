import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';

enum ItemLoadingStatus { initial, loading, loaded, error }

class ItemProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Item> _items = [];
  List<Item> _filteredItems = [];
  ItemLoadingStatus _status = ItemLoadingStatus.initial;
  String? _errorMessage;

  List<Item> get items => _filteredItems; // Agora retorna itens filtrados
  ItemLoadingStatus get status => _status;
  String? get errorMessage => _errorMessage;

  Future<void> fetchItems() async {
    _status = ItemLoadingStatus.loading;
    notifyListeners();
    try {
      _items = await _apiService.fetchItems();
      _filteredItems = List.from(_items); // Inicializa com todos os itens
      _status = ItemLoadingStatus.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _status = ItemLoadingStatus.error;
    }
    notifyListeners();
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      _filteredItems = List.from(_items);
    } else {
      _filteredItems = _items.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase()) ||
               item.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}

