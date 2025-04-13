import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/survey_question2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'survey_question1_model.dart';
export 'survey_question1_model.dart';

class SurveyQuestion1Widget extends StatefulWidget {
  const SurveyQuestion1Widget({super.key});

  @override
  State<SurveyQuestion1Widget> createState() => _SurveyQuestion1WidgetState();
}

class _SurveyQuestion1WidgetState extends State<SurveyQuestion1Widget> {
  late SurveyQuestion1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyQuestion1Model());

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
      width: double.infinity,
      height: double.infinity,
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
            'Rate the app',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.center,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: RatingBar.builder(
                  onRatingUpdate: (newValue) {
                    safeSetState(() => _model.ratingBarValue = newValue);
                    logFirebaseEvent(
                        'SURVEY_QUESTION1_RatingBar_fuwotos3_ON_T');
                    logFirebaseEvent('RatingBar_update_component_state');
                    _model.npcRating = _model.ratingBarValue?.round();
                    safeSetState(() {});
                  },
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  direction: Axis.horizontal,
                  initialRating: _model.ratingBarValue ??= 3.0,
                  unratedColor: FlutterFlowTheme.of(context).accent1,
                  itemCount: 5,
                  itemSize: 30.0,
                  glowColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ],
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SURVEY_QUESTION1_COMP_NEXT_BTN_ON_TAP');
              logFirebaseEvent('Button_backend_call');

              await currentUserReference!.update(createUsersRecordData(
                npcRating: _model.npcRating,
              ));
              logFirebaseEvent('Button_bottom_sheet');
              Navigator.pop(context);
              logFirebaseEvent('Button_bottom_sheet');
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
                      child: SurveyQuestion2Widget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: 'Next',
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
