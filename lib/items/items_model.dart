import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'items_widget.dart' show ItemsWidget;
import 'package:flutter/material.dart';

class ItemsModel extends FlutterFlowModel<ItemsWidget> {
  ///  Local state fields for this page.

  int? clickCount = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ItemName widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  String? _itemNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Meal name is required';
    }

    return null;
  }

  // State field(s) for ItemAmount widget.
  FocusNode? itemAmountFocusNode;
  TextEditingController? itemAmountTextController;
  String? Function(BuildContext, String?)? itemAmountTextControllerValidator;
  String? _itemAmountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Calories is required';
    }

    if (!RegExp('^\\d+\$').hasMatch(val)) {
      return 'Please enter a valid number';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    itemNameTextControllerValidator = _itemNameTextControllerValidator;
    itemAmountTextControllerValidator = _itemAmountTextControllerValidator;
  }

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    itemAmountFocusNode?.dispose();
    itemAmountTextController?.dispose();
  }
}
