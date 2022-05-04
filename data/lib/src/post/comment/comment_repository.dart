import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/post/comment/comment.dart' as domain;
import 'package:domain/post/comment/comment_repository.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../post.dart';

@LazySingleton(as: domain.CommentRepository)
class CommentRepository extends domain.CommentRepository {
  CommentRepository(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Stream<Either<Failure, List<domain.Comment>>> watchCommentsOfPost(
    String postId,
  ) =>
      postsRef
          .doc(postId)
          .comments
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Comment>>(
              querySnapshot.docs.map((doc) => doc.data.toDomain()).toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Stream<Either<Failure, List<domain.Comment>>> watchCommentsOfUser(
    String userId,
  ) =>
      _firebaseFirestore
          .collectionGroup('comments')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Comment>>(
              querySnapshot.docs
                  .map(
                    (doc) => CommentCollectionReference.fromFirestore(doc, null)
                        .toDomain(),
                  )
                  .toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Either<Failure, Unit>> createComment(domain.Comment comment) async {
    final batch = _firebaseFirestore.batch();
    final postDoc = postsRef.doc(comment.postId);
    final commentDoc = postsRef.doc(comment.postId).comments.doc();
    try {
      batch
        ..set(
          commentDoc.reference,
          Comment.fromDomain(
            comment.copyWith(id: commentDoc.id),
          ),
        )
        ..update(
          postDoc.reference,
          <String, FieldValue>{'commentCount': FieldValue.increment(1)},
        );
      await batch.commit();

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
