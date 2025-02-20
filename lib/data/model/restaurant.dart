class Restaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<String> categories;
  final Menu menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json["id"] ?? "",
      name: json["name"] ?? "Unknown Restaurant",
      description: json["description"] ?? "No description available",
      city: json["city"] ?? "Unknown City",
      address: json["address"] ?? "No address available",
      pictureId: json["pictureId"] ?? "", // Ensure it's a string
      categories: (json["categories"] as List<dynamic>?)
          ?.map((cat) => cat["name"] as String? ?? "Unknown")
          .toList() ??
          [],
      menus: json["menus"] != null ? Menu.fromJson(json["menus"]) : Menu(foods: [], drinks: []),
      rating: (json["rating"] as num?)?.toDouble() ?? 0.0, // Handle rating conversion safely
      customerReviews: (json["customerReviews"] as List<dynamic>?)
          ?.map((review) => CustomerReview.fromJson(review))
          .toList() ??
          [],
    );
  }
}


class Menu {
  final List<String> foods;
  final List<String> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      foods: List<String>.from(json["foods"].map((food) => food["name"])),
      drinks: List<String>.from(json["drinks"].map((drink) => drink["name"])),
    );
  }
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({required this.name, required this.review, required this.date});

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      name: json["name"],
      review: json["review"],
      date: json["date"],
    );
  }
}
