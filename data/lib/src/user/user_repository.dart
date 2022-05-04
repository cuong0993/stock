import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/user/user.dart' as domain;
import 'package:domain/user/user_repository.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'user.dart';

@LazySingleton(as: domain.UserRepository)
class UserRepository extends domain.UserRepository {
  @override
  Stream<Either<Failure, domain.User>> watchUser(String userId) => usersRef
      .doc(userId)
      .snapshots()
      .where((doc) => doc.exists)
      .map(
        (doc) => right<Failure, domain.User>(
          doc.data!.toDomain(),
        ),
      )
      .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Either<Failure, Unit>> update(
    String userId,
    String name,
    String photoUrl,
  ) async {
    try {
      await usersRef.doc(userId).update(name: name, photoUrl: photoUrl);

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> addToken(String userId, String token) async {
    try {
      await usersRef.doc(userId).reference.update(<String, FieldValue>{
        'tokens': FieldValue.arrayUnion(<String>[token]),
      });

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, domain.User>> getUser(String userId) async {
    try {
      final snapshot = await usersRef.doc(userId).get();

      return right(snapshot.data!.toDomain());
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
