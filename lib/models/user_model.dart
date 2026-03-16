class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String userType; // 'customer' or 'seller'
  final String? city;
  final DateTime createdAt;
  final double rating;
  final int totalAds;
  final int followers;
  final int following;
  final bool isVerified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl,
    required this.userType,
    this.city,
    required this.createdAt,
    this.rating = 0.0,
    this.totalAds = 0,
    this.followers = 0,
    this.following = 0,
    this.isVerified = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatarUrl: json['avatar_url'],
      userType: json['user_type'] ?? 'customer',
      city: json['city'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      rating: (json['rating'] ?? 0.0).toDouble(),
      totalAds: json['total_ads'] ?? 0,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      isVerified: json['is_verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'user_type': userType,
      'city': city,
      'created_at': createdAt.toIso8601String(),
      'rating': rating,
      'total_ads': totalAds,
      'followers': followers,
      'following': following,
      'is_verified': isVerified,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatarUrl,
    String? userType,
    String? city,
    DateTime? createdAt,
    double? rating,
    int? totalAds,
    int? followers,
    int? following,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      userType: userType ?? this.userType,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      rating: rating ?? this.rating,
      totalAds: totalAds ?? this.totalAds,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
