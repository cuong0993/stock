import 'package:dartz/dartz.dart';

import '../failure.dart';
import 'post.dart';

abstract class PostRepository {
  Stream<Either<Failure, List<Post>>> watchPosts();

  Stream<Either<Failure, Post>> watchPost(String postId);

  Stream<Either<Failure, List<Post>>> watchPostsOfUser(String userId);

  Future<Either<Failure, Unit>> createPost(Post post);
}
