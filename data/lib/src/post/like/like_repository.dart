import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/post/like/like.dart' as domain;
import 'package:domain/post/like/like_repository.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../post.dart';

@LazySingleton(as: domain.LikeRepository)
class LikeRepository extends domain.LikeRepository {
  LikeRepository(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Stream<Either<Failure, List<domain.Like>>> watchLikesOfPost(String postId) =>
      postsRef
          .doc(postId)
          .likes
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Like>>(
              querySnapshot.docs.map((doc) => doc.data.toDomain()).toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Either<Failure, Unit>> createLike(domain.Like like) async {
    final batch = _firebaseFirestore.batch();
    final postDoc = postsRef.doc(like.postId);
    final likeDoc = postDoc.likes.doc(like.userId);
    try {
      batch
        ..set(
          likeDoc.reference,
          Like.fromDomain(like.copyWith(id: likeDoc.id)),
        )
        ..update(
          postDoc.reference,
          <String, FieldValue>{
            'likedUserIds': FieldValue.arrayUnion(<String>[like.userId]),
          },
        );
      await batch.commit();

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeLike(domain.Like like) async {
    final batch = _firebaseFirestore.batch();
    final postDoc = postsRef.doc(like.postId);
    final likeDoc = postDoc.likes.doc(like.userId);
    try {
      batch
        ..delete(likeDoc.reference)
        ..update(
          postDoc.reference,
          <String, FieldValue>{
            'likedUserIds': FieldValue.arrayRemove(<String>[like.userId]),
          },
        );
      await batch.commit();

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
