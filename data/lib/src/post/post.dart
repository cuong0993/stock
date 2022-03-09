import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:domain/post/comment/comment.dart' as domain;
import 'package:domain/post/like/like.dart' as domain;
import 'package:domain/post/post.dart' as domain;
import 'package:json_annotation/json_annotation.dart';

import '../firebase_date_time_converter.dart';
import '../firebase_timestamp_converter.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    required this.userName,
    required this.userId,
    required this.userPhotoUrl,
    required this.text,
    required this.name,
    required this.tags,
    required this.images,
    required this.createdDate,
    required this.timeSlots,
    required this.commentCount,
    required this.likedUserIds,
    required this.id,
  }) {
    _$assertPost(this);
  }

  factory Post.fromDomain(domain.Post post) => Post(
        userName: post.userName,
        userId: post.userId,
        userPhotoUrl: post.userPhotoUrl,
        text: post.text,
        name: post.name,
        commentCount: post.commentCount,
        likedUserIds: post.likedUserIds,
        tags: post.tags,
        createdDate: post.createdDate,
        timeSlots: post.timeSlots,
        images: post.images,
        id: post.id,
      );

  final String userName;
  final String userId;
  final String userPhotoUrl;
  final String text;
  final String name;
  final List<String> tags;
  final List<String> images;
  @FirebaseDateTimeConverter()
  final DateTime createdDate;
  @FirebaseTimestampConverter()
  final List<DateTime> timeSlots;
  @Min(0)
  final int commentCount;
  List<String> likedUserIds;
  String id;

  domain.Post toDomain() => domain.Post(
        userName: userName,
        userId: userId,
        userPhotoUrl: userPhotoUrl,
        text: text,
        name: name,
        commentCount: commentCount,
        likedUserIds: likedUserIds,
        tags: tags,
        createdDate: createdDate,
        timeSlots: timeSlots,
        images: images,
        id: id,
      );
}

@Collection<Post>('posts')
@Collection<Like>('posts/*/likes')
@Collection<Comment>('posts/*/comments')
final postsRef = PostCollectionReference();

@JsonSerializable()
class Like {
  Like({
    required this.userName,
    required this.userId,
    required this.postId,
    required this.userPhotoUrl,
    required this.createdDate,
    required this.id,
  });

  factory Like.fromDomain(domain.Like like) => Like(
        userName: like.userName,
        userId: like.userId,
        postId: like.postId,
        userPhotoUrl: like.userPhotoUrl,
        createdDate: like.createdDate,
        id: like.id,
      );

  final String userName;
  final String userId;
  final String postId;
  final String userPhotoUrl;
  @FirebaseDateTimeConverter()
  final DateTime createdDate;
  final String id;

  domain.Like toDomain() => domain.Like(
        userName: userName,
        userId: userId,
        postId: postId,
        userPhotoUrl: userPhotoUrl,
        createdDate: createdDate,
        id: id,
      );
}

@JsonSerializable()
class Comment {
  const Comment({
    required this.userName,
    required this.userId,
    required this.postId,
    required this.userPhotoUrl,
    required this.text,
    required this.createdDate,
    required this.id,
  });
  factory Comment.fromDomain(domain.Comment comment) => Comment(
        userName: comment.userName,
        userId: comment.userId,
        postId: comment.postId,
        userPhotoUrl: comment.userPhotoUrl,
        text: comment.text,
        createdDate: comment.createdDate,
        id: comment.id,
      );
  final String userName;
  final String userId;
  final String postId;
  final String userPhotoUrl;
  final String text;
  @FirebaseDateTimeConverter()
  final DateTime createdDate;
  final String id;

  domain.Comment toDomain() => domain.Comment(
        userName: userName,
        userId: userId,
        postId: postId,
        userPhotoUrl: userPhotoUrl,
        text: text,
        createdDate: createdDate,
        id: id,
      );
}
