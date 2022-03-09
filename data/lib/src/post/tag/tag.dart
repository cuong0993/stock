import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:domain/post/tag/tag.dart' as domain;
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  const Tag({
    required this.name,
    required this.id,
  });

  factory Tag.fromDomain(Tag tag) => Tag(
        name: tag.name,
        id: tag.id,
      );

  final String name;
  final String id;

  domain.Tag toDomain() => domain.Tag(
        name: name,
        id: id,
      );
}

@Collection<Tag>('tags')
final tagsRef = TagCollectionReference();
