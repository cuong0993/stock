import 'package:dartz/dartz.dart';

import '../failure.dart';
import 'user.dart';

abstract class UserRepository {
  Stream<Either<Failure, User>> watchUser(String userId);

  Future<Either<Failure, Unit>> update(
    String userId,
    String name,
    String photoUrl,
  );

  Future<Either<Failure, Unit>> addToken(String userId, String token);

  Future<Either<Failure, User>> getUser(String userId);
}
