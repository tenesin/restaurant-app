import 'package:restaurant_app/data/model/restaurant.dart';

class PostReviewResult {
  PostReviewResult({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  factory PostReviewResult.fromJson(Map<String, dynamic> json) {
    return PostReviewResult(
      error: json["error"] ?? true, // Default to true if null
      message: json["message"] ?? "Unknown error", // Default message
      customerReviews: (json["customerReviews"] as List<dynamic>?)
          ?.map((x) => CustomerReview.fromJson(x))
          .toList() ??
          [], // Handle null case safely
    );
  }
}