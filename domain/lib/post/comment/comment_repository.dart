import 'package:dartz/dartz.dart';

import '../../failure.dart';
import 'comment.dart';

abstract class CommentRepository {
  Stream<Either<Failure, List<Comment>>> watchCommentsOfPost(String postId);

  Stream<Either<Failure, List<Comment>>> watchCommentsOfUser(String userId);

  Future<Either<Failure, Unit>> createComment(Comment comment);
}
