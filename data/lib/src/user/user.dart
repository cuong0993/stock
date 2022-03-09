import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:domain/user/user.dart' as domain;
import 'package:json_annotation/json_annotation.dart';

import '../firebase_timestamp_converter.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.tokens,
    required this.creationTime,
  });

  factory User.fromDomain(domain.User user) => User(
        id: user.id,
        name: user.name,
        photoUrl: user.photoUrl,
        tokens: user.tokens,
        creationTime: user.creationTime,
      );

  final String id;
  final String name;
  final String photoUrl;
  final List<String> tokens;
  @FirebaseTimestampConverter()
  final DateTime creationTime;

  domain.User toDomain() => domain.User(
        id: id,
        name: name,
        photoUrl: photoUrl,
        tokens: tokens,
        creationTime: creationTime,
      );
}

@Collection<User>('users')
final usersRef = UserCollectionReference();
