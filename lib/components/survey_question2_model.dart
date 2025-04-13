import '/flutter_flow/flutter_flow_util.dart';
import 'survey_question2_widget.dart' show SurveyQuestion2Widget;
import 'package:flutter/material.dart';

class SurveyQuestion2Model extends FlutterFlowModel<SurveyQuestion2Widget> {
  ///  Local state fields for this component.

  String? feedback;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
