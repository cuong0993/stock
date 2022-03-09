import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

import 'firebase_http_file_service.dart';

@LazySingleton(as: BaseCacheManager)
class FirebaseCacheManager extends CacheManager {
  FirebaseCacheManager(FirebaseStorage firebaseStorage)
      : super(
          Config(
            'cache',
            fileService: FirebaseHttpFileService(firebaseStorage),
          ),
        );
}
