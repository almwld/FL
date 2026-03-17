import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // دالة رفع الصور - تستقبل Uint8List كما هو مطلوب
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
