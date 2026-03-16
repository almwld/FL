class WalletModel {
  final String userId;
  final double yerBalance;
  final double sarBalance;
  final double usdBalance;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  WalletModel({
    required this.userId,
    this.yerBalance = 0.0,
    this.sarBalance = 0.0,
    this.usdBalance = 0.0,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      userId: json['user_id'] ?? '',
      yerBalance: (json['yer_balance'] ?? 0.0).toDouble(),
      sarBalance: (json['sar_balance'] ?? 0.0).toDouble(),
      usdBalance: (json['usd_balance'] ?? 0.0).toDouble(),
      isActive: json['is_active'] ?? true,
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'yer_balance': yerBalance,
      'sar_balance': sarBalance,
      'usd_balance': usdBalance,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  String get formattedYerBalance {
    return yerBalance.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String get formattedSarBalance {
    return sarBalance.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String get formattedUsdBalance {
    return usdBalance.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  double get totalBalanceInYer {
    // معدلات تحويل تقريبية
    const sarToYer = 66.75;
    const usdToYer = 250.0;
    return yerBalance + (sarBalance * sarToYer) + (usdBalance * usdToYer);
  }

  WalletModel copyWith({
    String? userId,
    double? yerBalance,
    double? sarBalance,
    double? usdBalance,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WalletModel(
      userId: userId ?? this.userId,
      yerBalance: yerBalance ?? this.yerBalance,
      sarBalance: sarBalance ?? this.sarBalance,
      usdBalance: usdBalance ?? this.usdBalance,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TransactionModel {
  final String id;
  final String userId;
  final String type; // 'deposit', 'withdraw', 'transfer', 'payment', 'refund'
  final double amount;
  final String currency;
  final String? description;
  final String status; // 'pending', 'completed', 'failed', 'cancelled'
  final DateTime createdAt;
  final String? recipientId;
  final String? recipientName;
  final String? referenceNumber;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.currency,
    this.description,
    this.status = 'pending',
    required this.createdAt,
    this.recipientId,
    this.recipientName,
    this.referenceNumber,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'YER',
      description: json['description'],
      status: json['status'] ?? 'pending',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      recipientId: json['recipient_id'],
      recipientName: json['recipient_name'],
      referenceNumber: json['reference_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'amount': amount,
      'currency': currency,
      'description': description,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'recipient_id': recipientId,
      'recipient_name': recipientName,
      'reference_number': referenceNumber,
    };
  }

  String get formattedAmount {
    final amountStr = amount.toStringAsFixed(currency == 'YER' ? 0 : 2)
        .replaceAllMapped(
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
    final sign = type == 'deposit' || type == 'refund' ? '+' : '-';
    return '$sign $amountStr $currencySymbol';
  }

  String get typeLabel {
    switch (type) {
      case 'deposit':
        return 'إيداع';
      case 'withdraw':
        return 'سحب';
      case 'transfer':
        return 'تحويل';
      case 'payment':
        return 'دفع';
      case 'refund':
        return 'استرداد';
      default:
        return 'عملية';
    }
  }

  String get statusLabel {
    switch (status) {
      case 'completed':
        return 'مكتمل';
      case 'pending':
        return 'قيد الانتظار';
      case 'failed':
        return 'فاشل';
      case 'cancelled':
        return 'ملغي';
      default:
        return status;
    }
  }
}
