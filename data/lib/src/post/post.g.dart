// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PostCollectionReference
    implements PostQuery, FirestoreCollectionReference<PostQuerySnapshot> {
  factory PostCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PostCollectionReference;

  static Post fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$PostFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Post value,
    SetOptions? options,
  ) {
    return _$PostToJson(value);
  }

  @override
  PostDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PostDocumentReference> add(Post value);
}

class _$PostCollectionReference extends _$PostQuery
    implements PostCollectionReference {
  factory _$PostCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PostCollectionReference._(
      firestore.collection('posts').withConverter(
            fromFirestore: PostCollectionReference.fromFirestore,
            toFirestore: PostCollectionReference.toFirestore,
          ),
    );
  }

  _$PostCollectionReference._(
    CollectionReference<Post> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Post> get reference =>
      super.reference as CollectionReference<Post>;

  @override
  PostDocumentReference doc([String? id]) {
    return PostDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PostDocumentReference> add(Post value) {
    return reference.add(value).then((ref) => PostDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PostDocumentReference
    extends FirestoreDocumentReference<PostDocumentSnapshot> {
  factory PostDocumentReference(DocumentReference<Post> reference) =
      _$PostDocumentReference;

  DocumentReference<Post> get reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  late final LikeCollectionReference likes = _$LikeCollectionReference(
    reference,
  );

  late final CommentCollectionReference comments = _$CommentCollectionReference(
    reference,
  );

  @override
  Stream<PostDocumentSnapshot> snapshots();

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String userName,
    String userId,
    String userPhotoUrl,
    String text,
    String name,
    List<String> tags,
    List<String> images,
    List<DateTime> timeSlots,
    int commentCount,
    List<String> likedUserIds,
    String id,
  });

  Future<void> set(Post value);
}

class _$PostDocumentReference
    extends FirestoreDocumentReference<PostDocumentSnapshot>
    implements PostDocumentReference {
  _$PostDocumentReference(this.reference);

  @override
  final DocumentReference<Post> reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  late final LikeCollectionReference likes = _$LikeCollectionReference(
    reference,
  );

  late final CommentCollectionReference comments = _$CommentCollectionReference(
    reference,
  );

  @override
  Stream<PostDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return PostDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return PostDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? userName = _sentinel,
    Object? userId = _sentinel,
    Object? userPhotoUrl = _sentinel,
    Object? text = _sentinel,
    Object? name = _sentinel,
    Object? tags = _sentinel,
    Object? images = _sentinel,
    Object? timeSlots = _sentinel,
    Object? commentCount = _sentinel,
    Object? likedUserIds = _sentinel,
    Object? id = _sentinel,
  }) async {
    final json = {
      if (userName != _sentinel) "userName": userName as String,
      if (userId != _sentinel) "userId": userId as String,
      if (userPhotoUrl != _sentinel) "userPhotoUrl": userPhotoUrl as String,
      if (text != _sentinel) "text": text as String,
      if (name != _sentinel) "name": name as String,
      if (tags != _sentinel) "tags": tags as List<String>,
      if (images != _sentinel) "images": images as List<String>,
      if (timeSlots != _sentinel) "timeSlots": timeSlots as List<DateTime>,
      if (commentCount != _sentinel) "commentCount": commentCount as int,
      if (likedUserIds != _sentinel)
        "likedUserIds": likedUserIds as List<String>,
      if (id != _sentinel) "id": id as String,
    };

    return reference.update(json);
  }

  Future<void> set(Post value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class PostDocumentSnapshot extends FirestoreDocumentSnapshot {
  PostDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Post? data;
}

abstract class PostQuery implements QueryReference<PostQuerySnapshot> {
  @override
  PostQuery limit(int limit);

  @override
  PostQuery limitToLast(int limit);

  PostQuery whereUserName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereUserPhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  PostQuery whereImages({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  PostQuery whereTimeSlots({
    List<DateTime>? isEqualTo,
    List<DateTime>? isNotEqualTo,
    List<DateTime>? isLessThan,
    List<DateTime>? isLessThanOrEqualTo,
    List<DateTime>? isGreaterThan,
    List<DateTime>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? arrayContainsAny,
  });
  PostQuery whereCommentCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  PostQuery whereLikedUserIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  PostQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  PostQuery orderByUserName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByUserPhotoUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByImages({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByTimeSlots({
    bool descending = false,
    List<DateTime> startAt,
    List<DateTime> startAfter,
    List<DateTime> endAt,
    List<DateTime> endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByCommentCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByLikedUserIds({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });
}

class _$PostQuery extends QueryReference<PostQuerySnapshot>
    implements PostQuery {
  _$PostQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Post> reference;

  PostQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Post> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return PostQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<PostDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: PostDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return PostQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<PostQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<PostQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  PostQuery limit(int limit) {
    return _$PostQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  PostQuery limitToLast(int limit) {
    return _$PostQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  PostQuery whereUserName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'userName',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'userId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery whereUserPhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'userPhotoUrl',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery whereText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'text',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$PostQuery(
      reference.where(
        'tags',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  PostQuery whereImages({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$PostQuery(
      reference.where(
        'images',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  PostQuery whereTimeSlots({
    List<DateTime>? isEqualTo,
    List<DateTime>? isNotEqualTo,
    List<DateTime>? isLessThan,
    List<DateTime>? isLessThanOrEqualTo,
    List<DateTime>? isGreaterThan,
    List<DateTime>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? arrayContainsAny,
  }) {
    return _$PostQuery(
      reference.where(
        'timeSlots',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  PostQuery whereCommentCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'commentCount',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery whereLikedUserIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$PostQuery(
      reference.where(
        'likedUserIds',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  PostQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PostQuery orderByUserName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userName', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByUserPhotoUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userPhotoUrl', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('text', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('tags', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByImages({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('images', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByTimeSlots({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('timeSlots', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByCommentCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('commentCount', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByLikedUserIds({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('likedUserIds', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  PostQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PostQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PostQuerySnapshot
    extends FirestoreQuerySnapshot<PostQueryDocumentSnapshot> {
  PostQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Post> snapshot;

  @override
  final List<PostQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PostDocumentSnapshot>> docChanges;
}

class PostQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements PostDocumentSnapshot {
  PostQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(snapshot.reference);
  }

  @override
  final Post data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class LikeCollectionReference
    implements LikeQuery, FirestoreCollectionReference<LikeQuerySnapshot> {
  factory LikeCollectionReference(
    DocumentReference<Post> parent,
  ) = _$LikeCollectionReference;

  static Like fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$LikeFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Like value,
    SetOptions? options,
  ) {
    return _$LikeToJson(value);
  }

  /// A reference to the containing [PostDocumentReference] if this is a subcollection.
  PostDocumentReference get parent;

  @override
  LikeDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<LikeDocumentReference> add(Like value);
}

class _$LikeCollectionReference extends _$LikeQuery
    implements LikeCollectionReference {
  factory _$LikeCollectionReference(
    DocumentReference<Post> parent,
  ) {
    return _$LikeCollectionReference._(
      PostDocumentReference(parent),
      parent.collection('likes').withConverter(
            fromFirestore: LikeCollectionReference.fromFirestore,
            toFirestore: LikeCollectionReference.toFirestore,
          ),
    );
  }

  _$LikeCollectionReference._(
    this.parent,
    CollectionReference<Like> reference,
  ) : super(reference, reference);

  @override
  final PostDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Like> get reference =>
      super.reference as CollectionReference<Like>;

  @override
  LikeDocumentReference doc([String? id]) {
    return LikeDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<LikeDocumentReference> add(Like value) {
    return reference.add(value).then((ref) => LikeDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$LikeCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class LikeDocumentReference
    extends FirestoreDocumentReference<LikeDocumentSnapshot> {
  factory LikeDocumentReference(DocumentReference<Like> reference) =
      _$LikeDocumentReference;

  DocumentReference<Like> get reference;

  /// A reference to the [LikeCollectionReference] containing this document.
  LikeCollectionReference get parent {
    return _$LikeCollectionReference(
      reference.parent.parent!.withConverter<Post>(
        fromFirestore: PostCollectionReference.fromFirestore,
        toFirestore: PostCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<LikeDocumentSnapshot> snapshots();

  @override
  Future<LikeDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String userName,
    String userId,
    String postId,
    String userPhotoUrl,
    String id,
  });

  Future<void> set(Like value);
}

class _$LikeDocumentReference
    extends FirestoreDocumentReference<LikeDocumentSnapshot>
    implements LikeDocumentReference {
  _$LikeDocumentReference(this.reference);

  @override
  final DocumentReference<Like> reference;

  /// A reference to the [LikeCollectionReference] containing this document.
  LikeCollectionReference get parent {
    return _$LikeCollectionReference(
      reference.parent.parent!.withConverter<Post>(
        fromFirestore: PostCollectionReference.fromFirestore,
        toFirestore: PostCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<LikeDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return LikeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<LikeDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return LikeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? userName = _sentinel,
    Object? userId = _sentinel,
    Object? postId = _sentinel,
    Object? userPhotoUrl = _sentinel,
    Object? id = _sentinel,
  }) async {
    final json = {
      if (userName != _sentinel) "userName": userName as String,
      if (userId != _sentinel) "userId": userId as String,
      if (postId != _sentinel) "postId": postId as String,
      if (userPhotoUrl != _sentinel) "userPhotoUrl": userPhotoUrl as String,
      if (id != _sentinel) "id": id as String,
    };

    return reference.update(json);
  }

  Future<void> set(Like value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class LikeDocumentSnapshot extends FirestoreDocumentSnapshot {
  LikeDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Like> snapshot;

  @override
  LikeDocumentReference get reference {
    return LikeDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Like? data;
}

abstract class LikeQuery implements QueryReference<LikeQuerySnapshot> {
  @override
  LikeQuery limit(int limit);

  @override
  LikeQuery limitToLast(int limit);

  LikeQuery whereUserName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  LikeQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  LikeQuery wherePostId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  LikeQuery whereUserPhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  LikeQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  LikeQuery orderByUserName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  });

  LikeQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  });

  LikeQuery orderByPostId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  });

  LikeQuery orderByUserPhotoUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  });

  LikeQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  });
}

class _$LikeQuery extends QueryReference<LikeQuerySnapshot>
    implements LikeQuery {
  _$LikeQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Like> reference;

  LikeQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Like> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return LikeQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<LikeDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: LikeDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return LikeQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<LikeQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<LikeQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  LikeQuery limit(int limit) {
    return _$LikeQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  LikeQuery limitToLast(int limit) {
    return _$LikeQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  LikeQuery whereUserName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$LikeQuery(
      reference.where(
        'userName',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LikeQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$LikeQuery(
      reference.where(
        'userId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LikeQuery wherePostId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$LikeQuery(
      reference.where(
        'postId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LikeQuery whereUserPhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$LikeQuery(
      reference.where(
        'userPhotoUrl',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LikeQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$LikeQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LikeQuery orderByUserName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userName', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LikeQuery(query, _collection);
  }

  LikeQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LikeQuery(query, _collection);
  }

  LikeQuery orderByPostId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('postId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LikeQuery(query, _collection);
  }

  LikeQuery orderByUserPhotoUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userPhotoUrl', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LikeQuery(query, _collection);
  }

  LikeQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LikeDocumentSnapshot? startAtDocument,
    LikeDocumentSnapshot? endAtDocument,
    LikeDocumentSnapshot? endBeforeDocument,
    LikeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LikeQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$LikeQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class LikeQuerySnapshot
    extends FirestoreQuerySnapshot<LikeQueryDocumentSnapshot> {
  LikeQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Like> snapshot;

  @override
  final List<LikeQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<LikeDocumentSnapshot>> docChanges;
}

class LikeQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements LikeDocumentSnapshot {
  LikeQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Like> snapshot;

  @override
  LikeDocumentReference get reference {
    return LikeDocumentReference(snapshot.reference);
  }

  @override
  final Like data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CommentCollectionReference
    implements
        CommentQuery,
        FirestoreCollectionReference<CommentQuerySnapshot> {
  factory CommentCollectionReference(
    DocumentReference<Post> parent,
  ) = _$CommentCollectionReference;

  static Comment fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CommentFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Comment value,
    SetOptions? options,
  ) {
    return _$CommentToJson(value);
  }

  /// A reference to the containing [PostDocumentReference] if this is a subcollection.
  PostDocumentReference get parent;

  @override
  CommentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CommentDocumentReference> add(Comment value);
}

class _$CommentCollectionReference extends _$CommentQuery
    implements CommentCollectionReference {
  factory _$CommentCollectionReference(
    DocumentReference<Post> parent,
  ) {
    return _$CommentCollectionReference._(
      PostDocumentReference(parent),
      parent.collection('comments').withConverter(
            fromFirestore: CommentCollectionReference.fromFirestore,
            toFirestore: CommentCollectionReference.toFirestore,
          ),
    );
  }

  _$CommentCollectionReference._(
    this.parent,
    CollectionReference<Comment> reference,
  ) : super(reference, reference);

  @override
  final PostDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Comment> get reference =>
      super.reference as CollectionReference<Comment>;

  @override
  CommentDocumentReference doc([String? id]) {
    return CommentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CommentDocumentReference> add(Comment value) {
    return reference.add(value).then((ref) => CommentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CommentDocumentReference
    extends FirestoreDocumentReference<CommentDocumentSnapshot> {
  factory CommentDocumentReference(DocumentReference<Comment> reference) =
      _$CommentDocumentReference;

  DocumentReference<Comment> get reference;

  /// A reference to the [CommentCollectionReference] containing this document.
  CommentCollectionReference get parent {
    return _$CommentCollectionReference(
      reference.parent.parent!.withConverter<Post>(
        fromFirestore: PostCollectionReference.fromFirestore,
        toFirestore: PostCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<CommentDocumentSnapshot> snapshots();

  @override
  Future<CommentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String userName,
    String userId,
    String postId,
    String userPhotoUrl,
    String text,
    String id,
  });

  Future<void> set(Comment value);
}

class _$CommentDocumentReference
    extends FirestoreDocumentReference<CommentDocumentSnapshot>
    implements CommentDocumentReference {
  _$CommentDocumentReference(this.reference);

  @override
  final DocumentReference<Comment> reference;

  /// A reference to the [CommentCollectionReference] containing this document.
  CommentCollectionReference get parent {
    return _$CommentCollectionReference(
      reference.parent.parent!.withConverter<Post>(
        fromFirestore: PostCollectionReference.fromFirestore,
        toFirestore: PostCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<CommentDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return CommentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<CommentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return CommentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? userName = _sentinel,
    Object? userId = _sentinel,
    Object? postId = _sentinel,
    Object? userPhotoUrl = _sentinel,
    Object? text = _sentinel,
    Object? id = _sentinel,
  }) async {
    final json = {
      if (userName != _sentinel) "userName": userName as String,
      if (userId != _sentinel) "userId": userId as String,
      if (postId != _sentinel) "postId": postId as String,
      if (userPhotoUrl != _sentinel) "userPhotoUrl": userPhotoUrl as String,
      if (text != _sentinel) "text": text as String,
      if (id != _sentinel) "id": id as String,
    };

    return reference.update(json);
  }

  Future<void> set(Comment value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class CommentDocumentSnapshot extends FirestoreDocumentSnapshot {
  CommentDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Comment> snapshot;

  @override
  CommentDocumentReference get reference {
    return CommentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Comment? data;
}

abstract class CommentQuery implements QueryReference<CommentQuerySnapshot> {
  @override
  CommentQuery limit(int limit);

  @override
  CommentQuery limitToLast(int limit);

  CommentQuery whereUserName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery wherePostId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereUserPhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  CommentQuery orderByUserName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByPostId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByUserPhotoUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });
}

class _$CommentQuery extends QueryReference<CommentQuerySnapshot>
    implements CommentQuery {
  _$CommentQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Comment> reference;

  CommentQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Comment> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return CommentQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<CommentDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: CommentDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return CommentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<CommentQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<CommentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  CommentQuery limit(int limit) {
    return _$CommentQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  CommentQuery limitToLast(int limit) {
    return _$CommentQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  CommentQuery whereUserName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        'userName',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        'userId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery wherePostId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        'postId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereUserPhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        'userPhotoUrl',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        'text',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery orderByUserName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userName', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByPostId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('postId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByUserPhotoUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('userPhotoUrl', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('text', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CommentQuerySnapshot
    extends FirestoreQuerySnapshot<CommentQueryDocumentSnapshot> {
  CommentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Comment> snapshot;

  @override
  final List<CommentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CommentDocumentSnapshot>> docChanges;
}

class CommentQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements CommentDocumentSnapshot {
  CommentQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Comment> snapshot;

  @override
  CommentDocumentReference get reference {
    return CommentDocumentReference(snapshot.reference);
  }

  @override
  final Comment data;
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

_$assertPost(Post instance) {
  const Min(0).validate(instance.commentCount, "commentCount");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String,
      text: json['text'] as String,
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdDate: const FirebaseDateTimeConverter()
          .fromJson(json['createdDate'] as Object),
      timeSlots: (json['timeSlots'] as List<dynamic>)
          .map((e) =>
              const FirebaseTimestampConverter().fromJson(e as Timestamp))
          .toList(),
      commentCount: json['commentCount'] as int,
      likedUserIds: (json['likedUserIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'userPhotoUrl': instance.userPhotoUrl,
      'text': instance.text,
      'name': instance.name,
      'tags': instance.tags,
      'images': instance.images,
      'createdDate':
          const FirebaseDateTimeConverter().toJson(instance.createdDate),
      'timeSlots': instance.timeSlots
          .map(const FirebaseTimestampConverter().toJson)
          .toList(),
      'commentCount': instance.commentCount,
      'likedUserIds': instance.likedUserIds,
      'id': instance.id,
    };

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      postId: json['postId'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String,
      createdDate: const FirebaseDateTimeConverter()
          .fromJson(json['createdDate'] as Object),
      id: json['id'] as String,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'postId': instance.postId,
      'userPhotoUrl': instance.userPhotoUrl,
      'createdDate':
          const FirebaseDateTimeConverter().toJson(instance.createdDate),
      'id': instance.id,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      postId: json['postId'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String,
      text: json['text'] as String,
      createdDate: const FirebaseDateTimeConverter()
          .fromJson(json['createdDate'] as Object),
      id: json['id'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'postId': instance.postId,
      'userPhotoUrl': instance.userPhotoUrl,
      'text': instance.text,
      'createdDate':
          const FirebaseDateTimeConverter().toJson(instance.createdDate),
      'id': instance.id,
    };
