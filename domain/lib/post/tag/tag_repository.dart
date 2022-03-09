import 'package:dartz/dartz.dart';

import '../../failure.dart';
import 'tag.dart';

// ignore: one_member_abstracts
abstract class TagRepository {
  Future<Either<Failure, List<Tag>>> getTags();
}
