import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'survey_question2_model.dart';
export 'survey_question2_model.dart';

class SurveyQuestion2Widget extends StatefulWidget {
  const SurveyQuestion2Widget({super.key});

  @override
  State<SurveyQuestion2Widget> createState() => _SurveyQuestion2WidgetState();
}

class _SurveyQuestion2WidgetState extends State<SurveyQuestion2Widget> {
  late SurveyQuestion2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyQuestion2Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351.9,
      height: 343.6,
      decoration: BoxDecoration(
        color: Color(0xFF677859),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Do you have any feedback',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          Container(
            width: 200.0,
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 2000),
                () async {
                  logFirebaseEvent('SURVEY_QUESTION2_TextField_b3dle1e4_ON_T');
                  logFirebaseEvent('TextField_update_component_state');
                  _model.feedback = _model.textController.text;
                  safeSetState(() {});
                },
              ),
              autofocus: false,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintText: 'We’d love to hear your thoughts!',
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondary,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              maxLines: 4,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SURVEY_QUESTION2_COMP_SUBMIT_BTN_ON_TAP');
              logFirebaseEvent('Button_backend_call');

              await currentUserReference!.update(createUsersRecordData(
                feedback: _model.feedback,
              ));
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed(MealsWidget.routeName);
            },
            text: 'Submit',
            options: FFButtonOptions(
              width: 200.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ].divide(SizedBox(height: 12.0)).addToStart(SizedBox(height: 16.0)),
      ),
    );
  }
}
