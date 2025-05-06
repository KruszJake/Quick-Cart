import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'meals_widget.dart' show MealsWidget;
import 'package:flutter/material.dart';

class MealsModel extends FlutterFlowModel<MealsWidget> {
  ///  Local state fields for this page.

  int? clickCount = 0;

  List<MealsRecord> filteredMeals = [];
  void addToFilteredMeals(MealsRecord item) => filteredMeals.add(item);
  void removeFromFilteredMeals(MealsRecord item) => filteredMeals.remove(item);
  void removeAtIndexFromFilteredMeals(int index) =>
      filteredMeals.removeAt(index);
  void insertAtIndexInFilteredMeals(int index, MealsRecord item) =>
      filteredMeals.insert(index, item);
  void updateFilteredMealsAtIndex(int index, Function(MealsRecord) updateFn) =>
      filteredMeals[index] = updateFn(filteredMeals[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for mealName widget.
  FocusNode? mealNameFocusNode;
  TextEditingController? mealNameTextController;
  String? Function(BuildContext, String?)? mealNameTextControllerValidator;
  String? _mealNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Meal name is required';
    }

    return null;
  }

  // State field(s) for calories widget.
  FocusNode? caloriesFocusNode;
  TextEditingController? caloriesTextController;
  String? Function(BuildContext, String?)? caloriesTextControllerValidator;
  String? _caloriesTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Calories is required';
    }

    if (!RegExp('^\\d+\$').hasMatch(val)) {
      return 'Please enter a valid number';
    }
    return null;
  }

  // State field(s) for mealType widget.
  String? mealTypeValue;
  FormFieldController<String>? mealTypeValueController;
  // State field(s) for Ingredients widget.
  FocusNode? ingredientsFocusNode;
  TextEditingController? ingredientsTextController;
  String? Function(BuildContext, String?)? ingredientsTextControllerValidator;
  // State field(s) for Search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  List<MealsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    mealNameTextControllerValidator = _mealNameTextControllerValidator;
    caloriesTextControllerValidator = _caloriesTextControllerValidator;
  }

  @override
  void dispose() {
    mealNameFocusNode?.dispose();
    mealNameTextController?.dispose();

    caloriesFocusNode?.dispose();
    caloriesTextController?.dispose();

    ingredientsFocusNode?.dispose();
    ingredientsTextController?.dispose();

    searchFocusNode?.dispose();
  }
}
