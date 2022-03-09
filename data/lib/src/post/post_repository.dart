import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/post/post.dart' as domain;
import 'package:domain/post/post_repository.dart' as domain;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'post.dart';

@LazySingleton(as: domain.PostRepository)
class PostRepository extends domain.PostRepository {
  PostRepository(this._firebaseStorage);

  final FirebaseStorage _firebaseStorage;

  @override
  Stream<Either<Failure, List<domain.Post>>> watchPosts() => postsRef
      .snapshots()
      .map(
        (querySnapshot) => right<Failure, List<domain.Post>>(
          querySnapshot.docs.map((doc) => doc.data.toDomain()).toList(),
        ),
      )
      .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Stream<Either<Failure, domain.Post>> watchPost(String postId) => postsRef
      .doc(postId)
      .snapshots()
      .where((event) => event.exists)
      .map(
        (event) => right<Failure, domain.Post>(
          event.data!.toDomain(),
        ),
      )
      .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Stream<Either<Failure, List<domain.Post>>> watchPostsOfUser(String userId) =>
      postsRef
          .whereUserId(isEqualTo: userId)
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Post>>(
              querySnapshot.docs.map((doc) => doc.data.toDomain()).toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Either<Failure, Unit>> createPost(domain.Post post) async {
    final imageStorageUrls = <String>[];
    final doc = postsRef.doc();
    var index = 0;
    try {
      await Future.wait(
        post.images.map((url) {
          final path = 'posts/${doc.id}/$index.${url.split('.').last}';
          imageStorageUrls.add(path);
          index++;

          return _firebaseStorage.ref(path).putFile(File(url));
        }),
      );
      await doc.set(
        Post.fromDomain(post.copyWith(id: doc.id, images: imageStorageUrls)),
      );

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
