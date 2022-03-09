import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class FirebaseDateTimeConverter implements JsonConverter<DateTime, Object> {
  const FirebaseDateTimeConverter();

  @override
  DateTime fromJson(Object json) => (json as Timestamp).toDate();

  // ignore: no-object-declaration
  @override
  Object toJson(Object object) => FieldValue.serverTimestamp();
}
