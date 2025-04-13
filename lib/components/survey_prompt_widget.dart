import '/components/survey_question1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'survey_prompt_model.dart';
export 'survey_prompt_model.dart';

class SurveyPromptWidget extends StatefulWidget {
  const SurveyPromptWidget({super.key});

  @override
  State<SurveyPromptWidget> createState() => _SurveyPromptWidgetState();
}

class _SurveyPromptWidgetState extends State<SurveyPromptWidget> {
  late SurveyPromptModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyPromptModel());

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
      height: 343.59,
      decoration: BoxDecoration(
        color: Color(0xFF677859),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Would you like to take a quick suvery',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SURVEY_PROMPT_COMP_Yesbutton_ON_TAP');
              logFirebaseEvent('Yesbutton_bottom_sheet');
              Navigator.pop(context);
              logFirebaseEvent('Yesbutton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 300.0,
                      child: SurveyQuestion1Widget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: 'Yes',
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
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SURVEY_PROMPT_COMP_Nobutton_ON_TAP');
              logFirebaseEvent('Nobutton_navigate_back');
              context.safePop();
            },
            text: 'No',
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
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
