import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FirebaseHttpFileService extends HttpFileService {
  FirebaseHttpFileService(this._firebaseStorage);

  final FirebaseStorage _firebaseStorage;

  @override
  Future<FileServiceResponse> get(
    String url, {
    Map<String, String>? headers = const {},
  }) async {
    final ref = _firebaseStorage.ref().child(url);
    final _url = await ref.getDownloadURL();

    return super.get(_url);
  }
}
