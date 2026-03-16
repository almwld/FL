import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';
import '../models/ad_model.dart';
import '../models/wallet_model.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // ==================== المصادقة ====================
  
  static Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future<AuthResponse> signUpWithEmail(
    String email, 
    String password, 
    Map<String, dynamic> userData,
  ) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
      data: userData,
    );
    return response;
  }

  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  static User? get currentUser => client.auth.currentUser;

  static bool get isAuthenticated => currentUser != null;

  // ==================== المستخدمين ====================

  static Future<UserModel?> getUserById(String userId) async {
    try {
      final response = await client
          .from('users')
          .select()
          .eq('id', userId)
          .single();
      
      return UserModel.fromJson(response);
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  static Future<UserModel?> getCurrentUserProfile() async {
    if (currentUser == null) return null;
    return await getUserById(currentUser!.id);
  }

  static Future<void> updateUserProfile(String userId, Map<String, dynamic> data) async {
    await client.from('users').update(data).eq('id', userId);
  }

  // ==================== الإعلانات ====================

  static Future<List<AdModel>> getAds({
    String? category,
    String? city,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    String sortBy = 'created_at',
    bool descending = true,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      var query = client.from('ads').select();

      if (category != null && category.isNotEmpty) {
        query = query.eq('category', category);
      }

      if (city != null && city.isNotEmpty) {
        query = query.eq('city', city);
      }

      if (minPrice != null) {
        query = query.gte('price', minPrice);
      }

      if (maxPrice != null) {
        query = query.lte('price', maxPrice);
      }

      if (searchQuery != null && searchQuery.isNotEmpty) {
        query = query.or('title.ilike.%$searchQuery%,description.ilike.%$searchQuery%');
      }

      final response = await query
          .order(sortBy, ascending: !descending)
          .range(offset, offset + limit - 1);

      return (response as List).map((json) => AdModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting ads: $e');
      return [];
    }
  }

  static Future<AdModel?> getAdById(String adId) async {
    try {
      final response = await client
          .from('ads')
          .select()
          .eq('id', adId)
          .single();
      
      return AdModel.fromJson(response);
    } catch (e) {
      print('Error getting ad: $e');
      return null;
    }
  }

  static Future<void> createAd(AdModel ad) async {
    await client.from('ads').insert(ad.toJson());
  }

  static Future<void> updateAd(String adId, Map<String, dynamic> data) async {
    await client.from('ads').update(data).eq('id', adId);
  }

  static Future<void> deleteAd(String adId) async {
    await client.from('ads').delete().eq('id', adId);
  }

  static Future<void> incrementAdViews(String adId) async {
    await client.rpc('increment_ad_views', params: {'ad_id': adId});
  }

  static Future<List<AdModel>> getFeaturedAds() async {
    try {
      final response = await client
          .from('ads')
          .select()
          .eq('is_featured', true)
          .eq('status', 'active')
          .order('created_at', ascending: false)
          .limit(10);

      return (response as List).map((json) => AdModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting featured ads: $e');
      return [];
    }
  }

  static Future<List<AdModel>> getAuctions() async {
    try {
      final response = await client
          .from('ads')
          .select()
          .eq('is_auction', true)
          .eq('status', 'active')
          .gt('auction_end_time', DateTime.now().toIso8601String())
          .order('auction_end_time', ascending: true)
          .limit(20);

      return (response as List).map((json) => AdModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting auctions: $e');
      return [];
    }
  }

  static Future<List<AdModel>> getOffers() async {
    try {
      final response = await client
          .from('ads')
          .select()
          .eq('is_offer', true)
          .eq('status', 'active')
          .order('created_at', ascending: false)
          .limit(20);

      return (response as List).map((json) => AdModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting offers: $e');
      return [];
    }
  }

  static Future<List<AdModel>> getMyAds(String userId) async {
    try {
      final response = await client
          .from('ads')
          .select()
          .eq('seller_id', userId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => AdModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting my ads: $e');
      return [];
    }
  }

  // ==================== المحفظة ====================

  static Future<WalletModel?> getWallet(String userId) async {
    try {
      final response = await client
          .from('wallets')
          .select()
          .eq('user_id', userId)
          .single();
      
      return WalletModel.fromJson(response);
    } catch (e) {
      print('Error getting wallet: $e');
      return null;
    }
  }

  static Future<void> createWallet(String userId) async {
    await client.from('wallets').insert({
      'user_id': userId,
      'yer_balance': 0.0,
      'sar_balance': 0.0,
      'usd_balance': 0.0,
      'is_active': true,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });
  }

  static Future<void> updateWalletBalance(
    String userId, 
    String currency, 
    double amount,
  ) async {
    final column = '${currency.toLowerCase()}_balance';
    await client.rpc(
      'update_wallet_balance',
      params: {
        'p_user_id': userId,
        'p_currency': currency,
        'p_amount': amount,
      },
    );
  }

  // ==================== المعاملات ====================

  static Future<List<TransactionModel>> getTransactions(
    String userId, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final response = await client
          .from('transactions')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      return (response as List).map((json) => TransactionModel.fromJson(json)).toList();
    } catch (e) {
      print('Error getting transactions: $e');
      return [];
    }
  }

  static Future<void> createTransaction(TransactionModel transaction) async {
    await client.from('transactions').insert(transaction.toJson());
  }

  // ==================== المفضلة ====================

  static Future<void> addToFavorites(String userId, String adId) async {
    await client.from('favorites').insert({
      'user_id': userId,
      'ad_id': adId,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  static Future<void> removeFromFavorites(String userId, String adId) async {
    await client
        .from('favorites')
        .delete()
        .eq('user_id', userId)
        .eq('ad_id', adId);
  }

  static Future<List<String>> getFavorites(String userId) async {
    try {
      final response = await client
          .from('favorites')
          .select('ad_id')
          .eq('user_id', userId);

      return (response as List).map((json) => json['ad_id'] as String).toList();
    } catch (e) {
      print('Error getting favorites: $e');
      return [];
    }
  }

  static Future<bool> isFavorite(String userId, String adId) async {
    try {
      final response = await client
          .from('favorites')
          .select()
          .eq('user_id', userId)
          .eq('ad_id', adId)
          .maybeSingle();

      return response != null;
    } catch (e) {
      return false;
    }
  }

  // ==================== المحادثات ====================

  static Future<List<Map<String, dynamic>>> getChats(String userId) async {
    try {
      final response = await client
          .from('chats')
          .select('*, other_user:users!inner(name, avatar_url)')
          .or('user1_id.eq.$userId,user2_id.eq.$userId')
          .order('last_message_time', ascending: false);

      return response as List<Map<String, dynamic>>;
    } catch (e) {
      print('Error getting chats: $e');
      return [];
    }
  }

  static Future<void> sendMessage(
    String chatId, 
    String senderId, 
    String content,
  ) async {
    await client.from('messages').insert({
      'chat_id': chatId,
      'sender_id': senderId,
      'content': content,
      'created_at': DateTime.now().toIso8601String(),
      'is_read': false,
    });

    await client.from('chats').update({
      'last_message': content,
      'last_message_time': DateTime.now().toIso8601String(),
    }).eq('id', chatId);
  }

  // ==================== رفع الملفات ====================

  static Future<String?> uploadImage(String path, List<int> fileBytes) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_$path';
      await client.storage.from('images').uploadBinary(
        fileName,
        fileBytes,
        fileOptions: const FileOptions(contentType: 'image/jpeg'),
      );

      final imageUrl = client.storage.from('images').getPublicUrl(fileName);
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
