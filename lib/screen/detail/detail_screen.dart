import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/provider/detail/bookmark_icon_provider.dart';
import 'package:restaurant_app/screen/detail/body_of_detail_screen_widget.dart';
import 'package:restaurant_app/screen/detail/bookmark_icon_widget.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;

  const DetailScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Completer<Restaurant> _completerRestaurant = Completer<Restaurant>();
  late Future<RestaurantDetailResponse> _futureRestaurantDetail;

  @override
  void initState() {
    super.initState();

    _futureRestaurantDetail = ApiServices().getRestaurantDetail(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Detail"),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),
            child: FutureBuilder(
                future: _completerRestaurant.future,
                builder: (context, snapshot) {
                  return switch (snapshot.connectionState) {
                    ConnectionState.done =>
                        BookmarkIconWidget(restaurant: snapshot.data!),
                    _ => const SizedBox(),
                  };
                }),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _futureRestaurantDetail,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              final restaurantData = snapshot.data!.restaurant;
              _completerRestaurant.complete(restaurantData);
              return BodyOfDetailScreenWidget(restaurant: restaurantData);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}