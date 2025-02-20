import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices apiService;
  RestaurantDetailProvider({required this.apiService});

  RestaurantDetailResponse? _restaurantDetail;
  String _errorMessage = "";
  bool _isLoading = false;

  RestaurantDetailResponse? get restaurantDetail => _restaurantDetail;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchRestaurantDetail(String restaurantId) async {
    try {
      _isLoading = true;
      notifyListeners();

      final result = await apiService.getRestaurantDetail(restaurantId);
      _restaurantDetail = result;
      _errorMessage = "";

    } catch (e) {
      _errorMessage = "Failed to load restaurant details: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
