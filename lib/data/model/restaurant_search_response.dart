import 'package:restaurant_app/data/model/restaurant.dart';
class RestaurantSearchResult {
  const RestaurantSearchResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  factory RestaurantSearchResult.fromJson(Map<String, dynamic> json) {
    return RestaurantSearchResult(
      error: json["error"] ?? true,
      founded: json["founded"] ?? 0,
      restaurants: (json["restaurants"] as List<dynamic>?)
          ?.map((x) => Restaurant.fromJson(x))
          .toList() ??
          [], // Default to empty list if null
    );
  }
}
