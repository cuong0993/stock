import 'package:dartz/dartz.dart';

import '../../failure.dart';
import 'like.dart';

abstract class LikeRepository {
  Stream<Either<Failure, List<Like>>> watchLikesOfPost(String postId);

  Future<Either<Failure, Unit>> createLike(Like like);

  Future<Either<Failure, Unit>> removeLike(Like like);
}
