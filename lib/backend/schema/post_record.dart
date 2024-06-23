import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postImage" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "userShares" field.
  int? _userShares;
  int get userShares => _userShares ?? 0;
  bool hasUserShares() => _userShares != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "postUsername" field.
  String? _postUsername;
  String get postUsername => _postUsername ?? '';
  bool hasPostUsername() => _postUsername != null;

  // "postUserImage" field.
  String? _postUserImage;
  String get postUserImage => _postUserImage ?? '';
  bool hasPostUserImage() => _postUserImage != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "userBookmarks" field.
  List<DocumentReference>? _userBookmarks;
  List<DocumentReference> get userBookmarks => _userBookmarks ?? const [];
  bool hasUserBookmarks() => _userBookmarks != null;

  // "userLikes" field.
  List<DocumentReference>? _userLikes;
  List<DocumentReference> get userLikes => _userLikes ?? const [];
  bool hasUserLikes() => _userLikes != null;

  // "comments" field.
  int? _comments;
  int get comments => _comments ?? 0;
  bool hasComments() => _comments != null;

  // "postID" field.
  String? _postID;
  String get postID => _postID ?? '';
  bool hasPostID() => _postID != null;

  // "postDisplayName" field.
  String? _postDisplayName;
  String get postDisplayName => _postDisplayName ?? '';
  bool hasPostDisplayName() => _postDisplayName != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  void _initializeFields() {
    _postImage = snapshotData['postImage'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _userShares = castToType<int>(snapshotData['userShares']);
    _postText = snapshotData['postText'] as String?;
    _postUsername = snapshotData['postUsername'] as String?;
    _postUserImage = snapshotData['postUserImage'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _userBookmarks = getDataList(snapshotData['userBookmarks']);
    _userLikes = getDataList(snapshotData['userLikes']);
    _comments = castToType<int>(snapshotData['comments']);
    _postID = snapshotData['postID'] as String?;
    _postDisplayName = snapshotData['postDisplayName'] as String?;
    _verified = snapshotData['verified'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? postImage,
  DocumentReference? postUser,
  int? userShares,
  String? postText,
  String? postUsername,
  String? postUserImage,
  DateTime? createdTime,
  int? comments,
  String? postID,
  String? postDisplayName,
  bool? verified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postImage': postImage,
      'postUser': postUser,
      'userShares': userShares,
      'postText': postText,
      'postUsername': postUsername,
      'postUserImage': postUserImage,
      'createdTime': createdTime,
      'comments': comments,
      'postID': postID,
      'postDisplayName': postDisplayName,
      'verified': verified,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postImage == e2?.postImage &&
        e1?.postUser == e2?.postUser &&
        e1?.userShares == e2?.userShares &&
        e1?.postText == e2?.postText &&
        e1?.postUsername == e2?.postUsername &&
        e1?.postUserImage == e2?.postUserImage &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.userBookmarks, e2?.userBookmarks) &&
        listEquality.equals(e1?.userLikes, e2?.userLikes) &&
        e1?.comments == e2?.comments &&
        e1?.postID == e2?.postID &&
        e1?.postDisplayName == e2?.postDisplayName &&
        e1?.verified == e2?.verified;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postImage,
        e?.postUser,
        e?.userShares,
        e?.postText,
        e?.postUsername,
        e?.postUserImage,
        e?.createdTime,
        e?.userBookmarks,
        e?.userLikes,
        e?.comments,
        e?.postID,
        e?.postDisplayName,
        e?.verified
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
