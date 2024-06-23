import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthGamesRecord extends FirestoreRecord {
  AuthGamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "battlenet" field.
  DocumentReference? _battlenet;
  DocumentReference? get battlenet => _battlenet;
  bool hasBattlenet() => _battlenet != null;

  // "steam" field.
  DocumentReference? _steam;
  DocumentReference? get steam => _steam;
  bool hasSteam() => _steam != null;

  // "xbox" field.
  DocumentReference? _xbox;
  DocumentReference? get xbox => _xbox;
  bool hasXbox() => _xbox != null;

  void _initializeFields() {
    _battlenet = snapshotData['battlenet'] as DocumentReference?;
    _steam = snapshotData['steam'] as DocumentReference?;
    _xbox = snapshotData['xbox'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('authGames');

  static Stream<AuthGamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuthGamesRecord.fromSnapshot(s));

  static Future<AuthGamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuthGamesRecord.fromSnapshot(s));

  static AuthGamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuthGamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuthGamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuthGamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuthGamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuthGamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuthGamesRecordData({
  DocumentReference? battlenet,
  DocumentReference? steam,
  DocumentReference? xbox,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'battlenet': battlenet,
      'steam': steam,
      'xbox': xbox,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuthGamesRecordDocumentEquality implements Equality<AuthGamesRecord> {
  const AuthGamesRecordDocumentEquality();

  @override
  bool equals(AuthGamesRecord? e1, AuthGamesRecord? e2) {
    return e1?.battlenet == e2?.battlenet &&
        e1?.steam == e2?.steam &&
        e1?.xbox == e2?.xbox;
  }

  @override
  int hash(AuthGamesRecord? e) =>
      const ListEquality().hash([e?.battlenet, e?.steam, e?.xbox]);

  @override
  bool isValidKey(Object? o) => o is AuthGamesRecord;
}
