class Food {
  final String id;
  final String foodName;
  final int iddsiLevelId;
  final double averageRating;
  final String userId;
  final DateTime lastUpdatedTimestamp;
  final String iddsiCodes;

  Food({
    required this.id,
    required this.foodName,
    required this.iddsiLevelId,
    required this.averageRating,
    required this.userId,
    required this.lastUpdatedTimestamp,
    required this.iddsiCodes,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      foodName: json['food_name'],
      iddsiLevelId: json['iddsi_level_Id'],
      averageRating: json['avarage_rating'].toDouble(),
      userId: json['user_id'],
      lastUpdatedTimestamp: DateTime.parse(json['last_updated_timestamp']),
      iddsiCodes: json['iddsi_codes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_name': foodName,
      'iddsi_level_Id': iddsiLevelId,
      'avarage_rating': averageRating,
      'user_id': userId,
      'last_updated_timestamp': lastUpdatedTimestamp.toIso8601String(),
      'iddsi_codes': iddsiCodes,
    };
  }
}