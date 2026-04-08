import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient client;

  SupabaseStorageService({required this.client});

  Future<void> createBucket({required String bucketName}) async {
    final List<Bucket> buckets = await client.storage.listBuckets();

    final bool isBucketExist = buckets.any((bucket) => bucket.id == bucketName);

    if (!isBucketExist) {
      await client.storage.createBucket(bucketName);
    }
  }

  Future<void> uploadFile({
    required File file,
    required String filePath,
    required String bucketName,
  }) async {
    await client.storage
        .from(bucketName)
        .upload(filePath, file, fileOptions: const FileOptions(upsert: true));
  }

  String getFileUrl({required String filePath, required String bucketName}) {
    return client.storage.from(bucketName).getPublicUrl(filePath);
  }

  Future<void> deleteImageFromStorage({
    required String bucketName,
    required String filePath,
  }) async {
    await client.storage.from(bucketName).remove([filePath]);
  }
}
