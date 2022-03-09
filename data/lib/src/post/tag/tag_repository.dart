import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/post/tag/tag.dart' as domain;
import 'package:domain/post/tag/tag_repository.dart' as domain;
import 'package:injectable/injectable.dart';

import 'tag.dart';

@LazySingleton(as: domain.TagRepository)
class TagRepository extends domain.TagRepository {
  @override
  Future<Either<Failure, List<domain.Tag>>> getTags() async {
    try {
      final querySnapshot = await tagsRef.get();

      return right(
        querySnapshot.docs.map((e) => e.data.toDomain()).toList(),
      );
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
