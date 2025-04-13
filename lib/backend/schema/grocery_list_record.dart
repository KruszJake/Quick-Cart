import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroceryListRecord extends FirestoreRecord {
  GroceryListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "createTime" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "mealName" field.
  String? _mealName;
  String get mealName => _mealName ?? '';
  bool hasMealName() => _mealName != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _createTime = snapshotData['createTime'] as DateTime?;
    _mealName = snapshotData['mealName'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groceryList');

  static Stream<GroceryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroceryListRecord.fromSnapshot(s));

  static Future<GroceryListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroceryListRecord.fromSnapshot(s));

  static GroceryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroceryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroceryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroceryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroceryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroceryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroceryListRecordData({
  String? userId,
  DateTime? createTime,
  String? mealName,
  String? ingredients,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'createTime': createTime,
      'mealName': mealName,
      'ingredients': ingredients,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroceryListRecordDocumentEquality implements Equality<GroceryListRecord> {
  const GroceryListRecordDocumentEquality();

  @override
  bool equals(GroceryListRecord? e1, GroceryListRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.createTime == e2?.createTime &&
        e1?.mealName == e2?.mealName &&
        e1?.ingredients == e2?.ingredients;
  }

  @override
  int hash(GroceryListRecord? e) => const ListEquality()
      .hash([e?.userId, e?.createTime, e?.mealName, e?.ingredients]);

  @override
  bool isValidKey(Object? o) => o is GroceryListRecord;
}
