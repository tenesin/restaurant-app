import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RestaurantListResponse> _futureRestaurantResponse;
  List<Restaurant> _allRestaurants = [];
  List<Restaurant> _filteredRestaurants = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureRestaurantResponse = _fetchRestaurant();
  }

  Future<RestaurantListResponse> _fetchRestaurant() async {
    try {
      final response = await ApiServices().getRestaurantList();
      debugPrint("API Response: ${response.toString()}");

      setState(() {
        _allRestaurants = response.restaurants;
        _filteredRestaurants = _allRestaurants;
      });

      return response;
    } catch (e) {
      debugPrint("API Error: $e");
      rethrow;
    }
  }

  void _searchRestaurants(String query) {
    final results = _allRestaurants.where((restaurant) {
      final nameLower = restaurant.name.toLowerCase();
      final cityLower = restaurant.city.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower) || cityLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredRestaurants = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textFieldFillColor = theme.brightness == Brightness.dark
        ? theme.colorScheme.surfaceContainerHighest
        : Colors.grey[200];

    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchRestaurants,
              decoration: InputDecoration(
                labelText: "Search restaurants...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: textFieldFillColor,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<RestaurantListResponse>(
              future: _futureRestaurantResponse,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  debugPrint("Error in FutureBuilder: ${snapshot.error}");
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  if (_filteredRestaurants.isEmpty) {
                    return const Center(child: Text("No restaurants found"));
                  }
                  return ListView.builder(
                    itemCount: _filteredRestaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = _filteredRestaurants[index];
                      return RestaurantCard(
                        restaurant: restaurant,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoute.detailRoute.name,
                            arguments: restaurant.id,
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Unexpected error occurred"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
