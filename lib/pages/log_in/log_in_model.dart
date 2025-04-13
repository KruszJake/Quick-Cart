import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:flutter/material.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for LogIn-email widget.
  FocusNode? logInEmailFocusNode;
  TextEditingController? logInEmailTextController;
  String? Function(BuildContext, String?)? logInEmailTextControllerValidator;
  String? _logInEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'email is invalid';
    }
    return null;
  }

  // State field(s) for LogIn-Password widget.
  FocusNode? logInPasswordFocusNode;
  TextEditingController? logInPasswordTextController;
  late bool logInPasswordVisibility;
  String? Function(BuildContext, String?)? logInPasswordTextControllerValidator;
  String? _logInPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    logInEmailTextControllerValidator = _logInEmailTextControllerValidator;
    logInPasswordVisibility = false;
    logInPasswordTextControllerValidator =
        _logInPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    logInEmailFocusNode?.dispose();
    logInEmailTextController?.dispose();

    logInPasswordFocusNode?.dispose();
    logInPasswordTextController?.dispose();
  }
}
