// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

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
abstract class TagCollectionReference
    implements TagQuery, FirestoreCollectionReference<TagQuerySnapshot> {
  factory TagCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TagCollectionReference;

  static Tag fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$TagFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Tag value,
    SetOptions? options,
  ) {
    return _$TagToJson(value);
  }

  @override
  TagDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TagDocumentReference> add(Tag value);
}

class _$TagCollectionReference extends _$TagQuery
    implements TagCollectionReference {
  factory _$TagCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TagCollectionReference._(
      firestore.collection('tags').withConverter(
            fromFirestore: TagCollectionReference.fromFirestore,
            toFirestore: TagCollectionReference.toFirestore,
          ),
    );
  }

  _$TagCollectionReference._(
    CollectionReference<Tag> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Tag> get reference =>
      super.reference as CollectionReference<Tag>;

  @override
  TagDocumentReference doc([String? id]) {
    return TagDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TagDocumentReference> add(Tag value) {
    return reference.add(value).then((ref) => TagDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TagCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TagDocumentReference
    extends FirestoreDocumentReference<TagDocumentSnapshot> {
  factory TagDocumentReference(DocumentReference<Tag> reference) =
      _$TagDocumentReference;

  DocumentReference<Tag> get reference;

  /// A reference to the [TagCollectionReference] containing this document.
  TagCollectionReference get parent {
    return _$TagCollectionReference(reference.firestore);
  }

  @override
  Stream<TagDocumentSnapshot> snapshots();

  @override
  Future<TagDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    String id,
  });

  Future<void> set(Tag value);
}

class _$TagDocumentReference
    extends FirestoreDocumentReference<TagDocumentSnapshot>
    implements TagDocumentReference {
  _$TagDocumentReference(this.reference);

  @override
  final DocumentReference<Tag> reference;

  /// A reference to the [TagCollectionReference] containing this document.
  TagCollectionReference get parent {
    return _$TagCollectionReference(reference.firestore);
  }

  @override
  Stream<TagDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TagDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TagDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TagDocumentSnapshot._(
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
    Object? name = _sentinel,
    Object? id = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (id != _sentinel) "id": id as String,
    };

    return reference.update(json);
  }

  Future<void> set(Tag value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TagDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TagDocumentSnapshot extends FirestoreDocumentSnapshot {
  TagDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Tag> snapshot;

  @override
  TagDocumentReference get reference {
    return TagDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Tag? data;
}

abstract class TagQuery implements QueryReference<TagQuerySnapshot> {
  @override
  TagQuery limit(int limit);

  @override
  TagQuery limitToLast(int limit);

  TagQuery whereName({
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
  TagQuery whereId({
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

  TagQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TagDocumentSnapshot? startAtDocument,
    TagDocumentSnapshot? endAtDocument,
    TagDocumentSnapshot? endBeforeDocument,
    TagDocumentSnapshot? startAfterDocument,
  });

  TagQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TagDocumentSnapshot? startAtDocument,
    TagDocumentSnapshot? endAtDocument,
    TagDocumentSnapshot? endBeforeDocument,
    TagDocumentSnapshot? startAfterDocument,
  });
}

class _$TagQuery extends QueryReference<TagQuerySnapshot> implements TagQuery {
  _$TagQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Tag> reference;

  TagQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Tag> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TagQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TagDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TagDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TagQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TagQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TagQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TagQuery limit(int limit) {
    return _$TagQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TagQuery limitToLast(int limit) {
    return _$TagQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TagQuery whereName({
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
    return _$TagQuery(
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

  TagQuery whereId({
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
    return _$TagQuery(
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

  TagQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TagDocumentSnapshot? startAtDocument,
    TagDocumentSnapshot? endAtDocument,
    TagDocumentSnapshot? endBeforeDocument,
    TagDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

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

    return _$TagQuery(query, _collection);
  }

  TagQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TagDocumentSnapshot? startAtDocument,
    TagDocumentSnapshot? endAtDocument,
    TagDocumentSnapshot? endBeforeDocument,
    TagDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: false);

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

    return _$TagQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TagQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TagQuerySnapshot
    extends FirestoreQuerySnapshot<TagQueryDocumentSnapshot> {
  TagQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Tag> snapshot;

  @override
  final List<TagQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TagDocumentSnapshot>> docChanges;
}

class TagQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TagDocumentSnapshot {
  TagQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Tag> snapshot;

  @override
  TagDocumentReference get reference {
    return TagDocumentReference(snapshot.reference);
  }

  @override
  final Tag data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
