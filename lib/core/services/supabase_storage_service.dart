import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient _client;

  SupabaseStorageService({required SupabaseClient client}) : _client = client;

  Future<void> createBucket({required String bucketName}) async {
    final List<Bucket> buckets = await _client.storage.listBuckets();

    final bool isBucketExist = buckets.any((bucket) => bucket.id == bucketName);

    if (!isBucketExist) {
      await _client.storage.createBucket(bucketName);
    }
  }

  Future<void> uploadFile({
    required File file,
    required String filePath,
    required String bucketName,
  }) async {
    await _client.storage
        .from(bucketName)
        .upload(filePath, file, fileOptions: const FileOptions(upsert: true));
  }

  String getFileUrl({required String filePath, required String bucketName}) {
    return _client.storage.from(bucketName).getPublicUrl(filePath);
  }

  Future<void> deleteImageFromStorage({
    required String bucketName,
    required String filePath,
  }) async {
    await _client.storage.from(bucketName).remove([filePath]);
  }
}
