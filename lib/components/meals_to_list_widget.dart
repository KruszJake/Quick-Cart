import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'meals_to_list_model.dart';
export 'meals_to_list_model.dart';

class MealsToListWidget extends StatefulWidget {
  const MealsToListWidget({super.key});

  @override
  State<MealsToListWidget> createState() => _MealsToListWidgetState();
}

class _MealsToListWidgetState extends State<MealsToListWidget> {
  late MealsToListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealsToListModel());

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
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Color(0xFF677859),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Text(
                'Select the meal',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            StreamBuilder<List<MealsRecord>>(
              stream: queryMealsRecord(
                queryBuilder: (mealsRecord) => mealsRecord.where(
                  'userId',
                  isEqualTo: currentUserUid,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<MealsRecord> listViewMealsRecordList = snapshot.data!;

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewMealsRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewMealsRecord =
                        listViewMealsRecordList[listViewIndex];
                    return Stack(
                      alignment: AlignmentDirectional(1.0, -0.8),
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              listViewMealsRecord.mealName,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            subtitle: Text(
                              listViewMealsRecord.ingredients,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.75, -0.8),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Checkbox(
                              value: _model
                                      .checkboxValueMap[listViewMealsRecord] ??=
                                  false,
                              onChanged: (newValue) async {
                                safeSetState(() => _model
                                        .checkboxValueMap[listViewMealsRecord] =
                                    newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'MEALS_TO_LIST_Checkbox_lndce7ty_ON_TOGGL');
                                  if (_model
                                      .checkboxValueMap[listViewMealsRecord]!) {
                                    logFirebaseEvent('Checkbox_backend_call');

                                    await GroceryListRecord.collection
                                        .doc()
                                        .set(createGroceryListRecordData(
                                          userId: currentUserUid,
                                          createTime: getCurrentTimestamp,
                                          mealName:
                                              listViewMealsRecord.mealName,
                                          ingredients:
                                              listViewMealsRecord.ingredients,
                                        ));
                                  }
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('MEALS_TO_LIST_COMP_listAdder_ON_TAP');
                logFirebaseEvent('listAdder_bottom_sheet');
                Navigator.pop(context);
              },
              text: 'Finished',
              options: FFButtonOptions(
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
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ]
              .divide(SizedBox(height: 12.0))
              .addToStart(SizedBox(height: 16.0))
              .addToEnd(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
