// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

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
abstract class MeetingCollectionReference
    implements
        MeetingQuery,
        FirestoreCollectionReference<MeetingQuerySnapshot> {
  factory MeetingCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MeetingCollectionReference;

  static Meeting fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$MeetingFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Meeting value,
    SetOptions? options,
  ) {
    return _$MeetingToJson(value);
  }

  @override
  MeetingDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MeetingDocumentReference> add(Meeting value);
}

class _$MeetingCollectionReference extends _$MeetingQuery
    implements MeetingCollectionReference {
  factory _$MeetingCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MeetingCollectionReference._(
      firestore.collection('meetings').withConverter(
            fromFirestore: MeetingCollectionReference.fromFirestore,
            toFirestore: MeetingCollectionReference.toFirestore,
          ),
    );
  }

  _$MeetingCollectionReference._(
    CollectionReference<Meeting> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Meeting> get reference =>
      super.reference as CollectionReference<Meeting>;

  @override
  MeetingDocumentReference doc([String? id]) {
    return MeetingDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MeetingDocumentReference> add(Meeting value) {
    return reference.add(value).then((ref) => MeetingDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MeetingCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MeetingDocumentReference
    extends FirestoreDocumentReference<MeetingDocumentSnapshot> {
  factory MeetingDocumentReference(DocumentReference<Meeting> reference) =
      _$MeetingDocumentReference;

  DocumentReference<Meeting> get reference;

  /// A reference to the [MeetingCollectionReference] containing this document.
  MeetingCollectionReference get parent {
    return _$MeetingCollectionReference(reference.firestore);
  }

  @override
  Stream<MeetingDocumentSnapshot> snapshots();

  @override
  Future<MeetingDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String id,
    String name,
    String createdUserId,
    int participantCount,
  });

  Future<void> set(Meeting value);
}

class _$MeetingDocumentReference
    extends FirestoreDocumentReference<MeetingDocumentSnapshot>
    implements MeetingDocumentReference {
  _$MeetingDocumentReference(this.reference);

  @override
  final DocumentReference<Meeting> reference;

  /// A reference to the [MeetingCollectionReference] containing this document.
  MeetingCollectionReference get parent {
    return _$MeetingCollectionReference(reference.firestore);
  }

  @override
  Stream<MeetingDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MeetingDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MeetingDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MeetingDocumentSnapshot._(
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
    Object? id = _sentinel,
    Object? name = _sentinel,
    Object? createdUserId = _sentinel,
    Object? participantCount = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String,
      if (name != _sentinel) "name": name as String,
      if (createdUserId != _sentinel) "createdUserId": createdUserId as String,
      if (participantCount != _sentinel)
        "participantCount": participantCount as int,
    };

    return reference.update(json);
  }

  Future<void> set(Meeting value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MeetingDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MeetingDocumentSnapshot extends FirestoreDocumentSnapshot {
  MeetingDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Meeting> snapshot;

  @override
  MeetingDocumentReference get reference {
    return MeetingDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Meeting? data;
}

abstract class MeetingQuery implements QueryReference<MeetingQuerySnapshot> {
  @override
  MeetingQuery limit(int limit);

  @override
  MeetingQuery limitToLast(int limit);

  MeetingQuery whereId({
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
  MeetingQuery whereName({
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
  MeetingQuery whereCreatedUserId({
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
  MeetingQuery whereParticipantCount({
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

  MeetingQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByCreatedUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByParticipantCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });
}

class _$MeetingQuery extends QueryReference<MeetingQuerySnapshot>
    implements MeetingQuery {
  _$MeetingQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Meeting> reference;

  MeetingQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Meeting> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MeetingQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MeetingDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MeetingDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MeetingQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MeetingQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MeetingQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MeetingQuery limit(int limit) {
    return _$MeetingQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MeetingQuery limitToLast(int limit) {
    return _$MeetingQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MeetingQuery whereId({
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
    return _$MeetingQuery(
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

  MeetingQuery whereName({
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
    return _$MeetingQuery(
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

  MeetingQuery whereCreatedUserId({
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
    return _$MeetingQuery(
      reference.where(
        'createdUserId',
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

  MeetingQuery whereParticipantCount({
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
    return _$MeetingQuery(
      reference.where(
        'participantCount',
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

  MeetingQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
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

    return _$MeetingQuery(query, _collection);
  }

  MeetingQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
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

    return _$MeetingQuery(query, _collection);
  }

  MeetingQuery orderByCreatedUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('createdUserId', descending: descending);

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

    return _$MeetingQuery(query, _collection);
  }

  MeetingQuery orderByParticipantCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('participantCount', descending: descending);

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

    return _$MeetingQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MeetingQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MeetingQuerySnapshot
    extends FirestoreQuerySnapshot<MeetingQueryDocumentSnapshot> {
  MeetingQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Meeting> snapshot;

  @override
  final List<MeetingQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MeetingDocumentSnapshot>> docChanges;
}

class MeetingQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements MeetingDocumentSnapshot {
  MeetingQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Meeting> snapshot;

  @override
  MeetingDocumentReference get reference {
    return MeetingDocumentReference(snapshot.reference);
  }

  @override
  final Meeting data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) => Meeting(
      participantIds: Map<String, bool>.from(json['participantIds'] as Map),
      participantNames:
          Map<String, String>.from(json['participantNames'] as Map),
      participantUrls: Map<String, String>.from(json['participantUrls'] as Map),
      id: json['id'] as String,
      name: json['name'] as String,
      time: const FirebaseTimestampConverter()
          .fromJson(json['time'] as Timestamp),
      createdUserId: json['createdUserId'] as String,
      participantCount: json['participantCount'] as int,
    );

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'participantIds': instance.participantIds,
      'participantNames': instance.participantNames,
      'participantUrls': instance.participantUrls,
      'id': instance.id,
      'name': instance.name,
      'time': const FirebaseTimestampConverter().toJson(instance.time),
      'createdUserId': instance.createdUserId,
      'participantCount': instance.participantCount,
    };
