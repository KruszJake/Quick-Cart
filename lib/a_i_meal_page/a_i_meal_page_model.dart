import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_meal_page_widget.dart' show AIMealPageWidget;
import 'package:flutter/material.dart';

class AIMealPageModel extends FlutterFlowModel<AIMealPageWidget> {
  ///  Local state fields for this page.

  String recipeName = ' ';

  String? mealText = 'meal text';

  String? mealName;

  int? mealCalories = 0;

  String? mealIngredients;

  dynamic mealResponse;

  /// Breakfast, Lunch, Dinner, or Snack
  String recipeType = 'Type';

  ///  State fields for stateful widgets in this page.

  // State field(s) for enterMeal widget.
  FocusNode? enterMealFocusNode;
  TextEditingController? enterMealTextController;
  String? Function(BuildContext, String?)? enterMealTextControllerValidator;
  // Stores action output result for [AI Agent - Send Message to mealGenerator] action in Button widget.
  Map<String, dynamic>? aIResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterMealFocusNode?.dispose();
    enterMealTextController?.dispose();
  }
}
