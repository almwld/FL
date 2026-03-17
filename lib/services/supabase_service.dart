import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // التحقق من حالة تسجيل الدخول
  static bool get isAuthenticated => client.auth.currentUser != null;
  
  // الحصول على المستخدم الحالي
  static User? get currentUser => client.auth.currentUser;

  // تسجيل الدخول
  static Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // إنشاء حساب جديد
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

  // تسجيل الخروج
  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  // إعادة تعيين كلمة المرور
  static Future<void> resetPassword(String email) async {
    await client.auth.resetPasswordForEmail(email);
  }

  // تحديث كلمة المرور
  static Future<void> updatePassword(String newPassword) async {
    await client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }

  // رفع الصور
  static Future<String> uploadImage(String bucket, Uint8List fileBytes, String fileName) async {
    final response = await client.storage.from(bucket).uploadBinary(
      fileName,
      fileBytes,
      fileOptions: const FileOptions(contentType: 'image/jpeg'),
    );
    return response;
  }

  // دالة مساعدة لتحويل List<int> إلى Uint8List
  static Uint8List convertToUint8List(List<int> bytes) {
    return Uint8List.fromList(bytes);
  }
}
