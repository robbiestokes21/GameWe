import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameDataRecord extends FirestoreRecord {
  GameDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "steamID" field.
  List<String>? _steamID;
  List<String> get steamID => _steamID ?? const [];
  bool hasSteamID() => _steamID != null;

  // "xboxID" field.
  List<String>? _xboxID;
  List<String> get xboxID => _xboxID ?? const [];
  bool hasXboxID() => _xboxID != null;

  // "battlenetID" field.
  List<String>? _battlenetID;
  List<String> get battlenetID => _battlenetID ?? const [];
  bool hasBattlenetID() => _battlenetID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _steamID = getDataList(snapshotData['steamID']);
    _xboxID = getDataList(snapshotData['xboxID']);
    _battlenetID = getDataList(snapshotData['battlenetID']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('gameData')
          : FirebaseFirestore.instance.collectionGroup('gameData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('gameData').doc(id);

  static Stream<GameDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GameDataRecord.fromSnapshot(s));

  static Future<GameDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GameDataRecord.fromSnapshot(s));

  static GameDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GameDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GameDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GameDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GameDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GameDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGameDataRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class GameDataRecordDocumentEquality implements Equality<GameDataRecord> {
  const GameDataRecordDocumentEquality();

  @override
  bool equals(GameDataRecord? e1, GameDataRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.steamID, e2?.steamID) &&
        listEquality.equals(e1?.xboxID, e2?.xboxID) &&
        listEquality.equals(e1?.battlenetID, e2?.battlenetID);
  }

  @override
  int hash(GameDataRecord? e) =>
      const ListEquality().hash([e?.steamID, e?.xboxID, e?.battlenetID]);

  @override
  bool isValidKey(Object? o) => o is GameDataRecord;
}
