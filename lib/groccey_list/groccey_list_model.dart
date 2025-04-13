import '/flutter_flow/flutter_flow_util.dart';
import 'groccey_list_widget.dart' show GrocceyListWidget;
import 'package:flutter/material.dart';

class GrocceyListModel extends FlutterFlowModel<GrocceyListWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> selectedMealRefs = [];
  void addToSelectedMealRefs(DocumentReference item) =>
      selectedMealRefs.add(item);
  void removeFromSelectedMealRefs(DocumentReference item) =>
      selectedMealRefs.remove(item);
  void removeAtIndexFromSelectedMealRefs(int index) =>
      selectedMealRefs.removeAt(index);
  void insertAtIndexInSelectedMealRefs(int index, DocumentReference item) =>
      selectedMealRefs.insert(index, item);
  void updateSelectedMealRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedMealRefs[index] = updateFn(selectedMealRefs[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
