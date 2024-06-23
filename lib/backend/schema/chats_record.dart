import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userImages" field.
  List<String>? _userImages;
  List<String> get userImages => _userImages ?? const [];
  bool hasUserImages() => _userImages != null;

  // "userUsernames" field.
  List<String>? _userUsernames;
  List<String> get userUsernames => _userUsernames ?? const [];
  bool hasUserUsernames() => _userUsernames != null;

  // "userID" field.
  List<DocumentReference>? _userID;
  List<DocumentReference> get userID => _userID ?? const [];
  bool hasUserID() => _userID != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTS" field.
  DateTime? _lastMessageTS;
  DateTime? get lastMessageTS => _lastMessageTS;
  bool hasLastMessageTS() => _lastMessageTS != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  void _initializeFields() {
    _userImages = getDataList(snapshotData['userImages']);
    _userUsernames = getDataList(snapshotData['userUsernames']);
    _userID = getDataList(snapshotData['userID']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTS = snapshotData['lastMessageTS'] as DateTime?;
    _verified = snapshotData['verified'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTS,
  bool? verified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageTS': lastMessageTS,
      'verified': verified,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userImages, e2?.userImages) &&
        listEquality.equals(e1?.userUsernames, e2?.userUsernames) &&
        listEquality.equals(e1?.userID, e2?.userID) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTS == e2?.lastMessageTS &&
        e1?.verified == e2?.verified;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userImages,
        e?.userUsernames,
        e?.userID,
        e?.lastMessage,
        e?.lastMessageTS,
        e?.verified
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
