class AdModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String? oldPrice;
  final String currency;
  final List<String> images;
  final String category;
  final String subCategory;
  final String city;
  final String sellerId;
  final String sellerName;
  final String? sellerAvatar;
  final double sellerRating;
  final DateTime createdAt;
  final bool isAuction;
  final DateTime? auctionEndTime;
  final double? currentBid;
  final int bidCount;
  final bool isFeatured;
  final bool isOffer;
  final int? discountPercentage;
  final String condition; // 'new', 'used', 'like_new'
  final int views;
  final int favorites;
  final String status; // 'active', 'sold', 'expired', 'pending'
  final Map<String, dynamic>? additionalInfo;

  AdModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    this.currency = 'YER',
    required this.images,
    required this.category,
    required this.subCategory,
    required this.city,
    required this.sellerId,
    required this.sellerName,
    this.sellerAvatar,
    this.sellerRating = 0.0,
    required this.createdAt,
    this.isAuction = false,
    this.auctionEndTime,
    this.currentBid,
    this.bidCount = 0,
    this.isFeatured = false,
    this.isOffer = false,
    this.discountPercentage,
    this.condition = 'new',
    this.views = 0,
    this.favorites = 0,
    this.status = 'active',
    this.additionalInfo,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      oldPrice: json['old_price'],
      currency: json['currency'] ?? 'YER',
      images: List<String>.from(json['images'] ?? []),
      category: json['category'] ?? '',
      subCategory: json['sub_category'] ?? '',
      city: json['city'] ?? '',
      sellerId: json['seller_id'] ?? '',
      sellerName: json['seller_name'] ?? '',
      sellerAvatar: json['seller_avatar'],
      sellerRating: (json['seller_rating'] ?? 0.0).toDouble(),
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      isAuction: json['is_auction'] ?? false,
      auctionEndTime: json['auction_end_time'] != null 
          ? DateTime.parse(json['auction_end_time']) 
          : null,
      currentBid: json['current_bid'] != null 
          ? (json['current_bid']).toDouble() 
          : null,
      bidCount: json['bid_count'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      isOffer: json['is_offer'] ?? false,
      discountPercentage: json['discount_percentage'],
      condition: json['condition'] ?? 'new',
      views: json['views'] ?? 0,
      favorites: json['favorites'] ?? 0,
      status: json['status'] ?? 'active',
      additionalInfo: json['additional_info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'old_price': oldPrice,
      'currency': currency,
      'images': images,
      'category': category,
      'sub_category': subCategory,
      'city': city,
      'seller_id': sellerId,
      'seller_name': sellerName,
      'seller_avatar': sellerAvatar,
      'seller_rating': sellerRating,
      'created_at': createdAt.toIso8601String(),
      'is_auction': isAuction,
      'auction_end_time': auctionEndTime?.toIso8601String(),
      'current_bid': currentBid,
      'bid_count': bidCount,
      'is_featured': isFeatured,
      'is_offer': isOffer,
      'discount_percentage': discountPercentage,
      'condition': condition,
      'views': views,
      'favorites': favorites,
      'status': status,
      'additional_info': additionalInfo,
    };
  }

  String get formattedPrice {
    final priceStr = price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    String currencySymbol;
    switch (currency) {
      case 'SAR':
        currencySymbol = 'ر.س';
        break;
      case 'USD':
        currencySymbol = '\$';
        break;
      case 'YER':
      default:
        currencySymbol = 'ر.ي';
    }
    return '$priceStr $currencySymbol';
  }

  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(createdAt);
    
    if (diff.inDays > 365) {
      return '${diff.inDays ~/ 365} سنة';
    } else if (diff.inDays > 30) {
      return '${diff.inDays ~/ 30} شهر';
    } else if (diff.inDays > 0) {
      return '${diff.inDays} يوم';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} ساعة';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} دقيقة';
    } else {
      return 'الآن';
    }
  }

  AdModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? oldPrice,
    String? currency,
    List<String>? images,
    String? category,
    String? subCategory,
    String? city,
    String? sellerId,
    String? sellerName,
    String? sellerAvatar,
    double? sellerRating,
    DateTime? createdAt,
    bool? isAuction,
    DateTime? auctionEndTime,
    double? currentBid,
    int? bidCount,
    bool? isFeatured,
    bool? isOffer,
    int? discountPercentage,
    String? condition,
    int? views,
    int? favorites,
    String? status,
    Map<String, dynamic>? additionalInfo,
  }) {
    return AdModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      currency: currency ?? this.currency,
      images: images ?? this.images,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      city: city ?? this.city,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      sellerAvatar: sellerAvatar ?? this.sellerAvatar,
      sellerRating: sellerRating ?? this.sellerRating,
      createdAt: createdAt ?? this.createdAt,
      isAuction: isAuction ?? this.isAuction,
      auctionEndTime: auctionEndTime ?? this.auctionEndTime,
      currentBid: currentBid ?? this.currentBid,
      bidCount: bidCount ?? this.bidCount,
      isFeatured: isFeatured ?? this.isFeatured,
      isOffer: isOffer ?? this.isOffer,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      condition: condition ?? this.condition,
      views: views ?? this.views,
      favorites: favorites ?? this.favorites,
      status: status ?? this.status,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }
}
