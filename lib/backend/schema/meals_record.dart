import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealsRecord extends FirestoreRecord {
  MealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mealName" field.
  String? _mealName;
  String get mealName => _mealName ?? '';
  bool hasMealName() => _mealName != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "mealType" field.
  String? _mealType;
  String get mealType => _mealType ?? '';
  bool hasMealType() => _mealType != null;

  // "createTime" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "Item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  // "ItemAmount" field.
  int? _itemAmount;
  int get itemAmount => _itemAmount ?? 0;
  bool hasItemAmount() => _itemAmount != null;

  void _initializeFields() {
    _mealName = snapshotData['mealName'] as String?;
    _calories = castToType<int>(snapshotData['calories']);
    _mealType = snapshotData['mealType'] as String?;
    _createTime = snapshotData['createTime'] as DateTime?;
    _userId = snapshotData['userId'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _item = snapshotData['Item'] as String?;
    _itemAmount = castToType<int>(snapshotData['ItemAmount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealsRecord.fromSnapshot(s));

  static Future<MealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealsRecord.fromSnapshot(s));

  static MealsRecord fromSnapshot(DocumentSnapshot snapshot) => MealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealsRecordData({
  String? mealName,
  int? calories,
  String? mealType,
  DateTime? createTime,
  String? userId,
  String? ingredients,
  String? item,
  int? itemAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mealName': mealName,
      'calories': calories,
      'mealType': mealType,
      'createTime': createTime,
      'userId': userId,
      'ingredients': ingredients,
      'Item': item,
      'ItemAmount': itemAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealsRecordDocumentEquality implements Equality<MealsRecord> {
  const MealsRecordDocumentEquality();

  @override
  bool equals(MealsRecord? e1, MealsRecord? e2) {
    return e1?.mealName == e2?.mealName &&
        e1?.calories == e2?.calories &&
        e1?.mealType == e2?.mealType &&
        e1?.createTime == e2?.createTime &&
        e1?.userId == e2?.userId &&
        e1?.ingredients == e2?.ingredients &&
        e1?.item == e2?.item &&
        e1?.itemAmount == e2?.itemAmount;
  }

  @override
  int hash(MealsRecord? e) => const ListEquality().hash([
        e?.mealName,
        e?.calories,
        e?.mealType,
        e?.createTime,
        e?.userId,
        e?.ingredients,
        e?.item,
        e?.itemAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is MealsRecord;
}
