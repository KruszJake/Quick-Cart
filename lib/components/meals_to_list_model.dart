import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meals_to_list_widget.dart' show MealsToListWidget;
import 'package:flutter/material.dart';

class MealsToListModel extends FlutterFlowModel<MealsToListWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> checkedMeals = [];
  void addToCheckedMeals(DocumentReference item) => checkedMeals.add(item);
  void removeFromCheckedMeals(DocumentReference item) =>
      checkedMeals.remove(item);
  void removeAtIndexFromCheckedMeals(int index) => checkedMeals.removeAt(index);
  void insertAtIndexInCheckedMeals(int index, DocumentReference item) =>
      checkedMeals.insert(index, item);
  void updateCheckedMealsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      checkedMeals[index] = updateFn(checkedMeals[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<MealsRecord, bool> checkboxValueMap = {};
  List<MealsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
