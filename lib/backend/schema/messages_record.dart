import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "senderID" field.
  DocumentReference? _senderID;
  DocumentReference? get senderID => _senderID;
  bool hasSenderID() => _senderID != null;

  // "senderUsername" field.
  String? _senderUsername;
  String get senderUsername => _senderUsername ?? '';
  bool hasSenderUsername() => _senderUsername != null;

  // "senderImage" field.
  String? _senderImage;
  String get senderImage => _senderImage ?? '';
  bool hasSenderImage() => _senderImage != null;

  // "senderText" field.
  String? _senderText;
  String get senderText => _senderText ?? '';
  bool hasSenderText() => _senderText != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  bool hasMessageImage() => _messageImage != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderID = snapshotData['senderID'] as DocumentReference?;
    _senderUsername = snapshotData['senderUsername'] as String?;
    _senderImage = snapshotData['senderImage'] as String?;
    _senderText = snapshotData['senderText'] as String?;
    _messageImage = snapshotData['messageImage'] as String?;
    _verified = snapshotData['verified'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? senderID,
  String? senderUsername,
  String? senderImage,
  String? senderText,
  String? messageImage,
  bool? verified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderID': senderID,
      'senderUsername': senderUsername,
      'senderImage': senderImage,
      'senderText': senderText,
      'messageImage': messageImage,
      'verified': verified,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.senderID == e2?.senderID &&
        e1?.senderUsername == e2?.senderUsername &&
        e1?.senderImage == e2?.senderImage &&
        e1?.senderText == e2?.senderText &&
        e1?.messageImage == e2?.messageImage &&
        e1?.verified == e2?.verified;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.senderID,
        e?.senderUsername,
        e?.senderImage,
        e?.senderText,
        e?.messageImage,
        e?.verified
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
