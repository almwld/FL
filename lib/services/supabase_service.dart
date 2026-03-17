import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // ==================== المصادقة ====================

  static User? get currentUser => client.auth.currentUser;
  static bool get isAuthenticated => currentUser != null;

  static Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    return await client.auth.signUp(
      email: email,
      password: password,
      data: data,
    );
  }

  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    await client.auth.resetPasswordForEmail(email);
  }

  // ==================== الإعلانات ====================

  static Future<List<Map<String, dynamic>>> getAds() async {
    final response = await client
        .from('ads')
        .select('*, profiles:user_id(*)')
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<Map<String, dynamic>?> getAd(String id) async {
    final response = await client
        .from('ads')
        .select('*, profiles:user_id(*)')
        .eq('id', id)
        .single();
    return response;
  }

  static Future<void> addAd(Map<String, dynamic> adData) async {
    await client.from('ads').insert({
      ...adData,
      'user_id': currentUser!.id,
    });
  }

  static Future<void> updateAd(String id, Map<String, dynamic> adData) async {
    await client.from('ads').update(adData).eq('id', id);
  }

  static Future<void> deleteAd(String id) async {
    await client.from('ads').delete().eq('id', id);
  }

  static Future<List<Map<String, dynamic>>> getUserAds() async {
    final response = await client
        .from('ads')
        .select('*')
        .eq('user_id', currentUser!.id)
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  // ==================== المفضلة ====================

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final response = await client
        .from('favorites')
        .select('*, ads(*)')
        .eq('user_id', currentUser!.id)
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<void> addToFavorites(String adId) async {
    await client.from('favorites').insert({
      'user_id': currentUser!.id,
      'ad_id': adId,
    });
  }

  static Future<void> removeFromFavorites(String adId) async {
    await client
        .from('favorites')
        .delete()
        .eq('user_id', currentUser!.id)
        .eq('ad_id', adId);
  }

  static Future<bool> isFavorite(String adId) async {
    final response = await client
        .from('favorites')
        .select('id')
        .eq('user_id', currentUser!.id)
        .eq('ad_id', adId)
        .maybeSingle();
    return response != null;
  }

  // ==================== المحفظة ====================

  static Future<Map<String, dynamic>?> getWallet() async {
    final response = await client
        .from('wallets')
        .select('*')
        .eq('user_id', currentUser!.id)
        .maybeSingle();
    return response;
  }

  static Future<void> createWallet() async {
    await client.from('wallets').insert({
      'user_id': currentUser!.id,
      'yer_balance': 0.0,
      'sar_balance': 0.0,
      'usd_balance': 0.0,
    });
  }

  static Future<void> updateBalance(String currency, double amount) async {
    await client.rpc('update_balance', params: {
      'p_user_id': currentUser!.id,
      'p_currency': currency,
      'p_amount': amount,
    });
  }

  static Future<List<Map<String, dynamic>>> getTransactions() async {
    final response = await client
        .from('transactions')
        .select('*')
        .eq('user_id', currentUser!.id)
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<void> addTransaction(Map<String, dynamic> transactionData) async {
    await client.from('transactions').insert({
      ...transactionData,
      'user_id': currentUser!.id,
    });
  }
}
