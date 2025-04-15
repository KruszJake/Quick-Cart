import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'a_i_meal_page_model.dart';
export 'a_i_meal_page_model.dart';

class AIMealPageWidget extends StatefulWidget {
  const AIMealPageWidget({super.key});

  static String routeName = 'AIMealPage';
  static String routePath = '/aIMealPage';

  @override
  State<AIMealPageWidget> createState() => _AIMealPageWidgetState();
}

class _AIMealPageWidgetState extends State<AIMealPageWidget> {
  late AIMealPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AIMealPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AIMealPage'});
    _model.enterMealTextController ??= TextEditingController();
    _model.enterMealFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: colorFromCssString(
          getRemoteConfigString('mealBackground'),
          defaultColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        'Generate a Meal',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x15000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'What type of meal would you like?',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextFormField(
                                key: ValueKey('enterMeal_26n2'),
                                controller: _model.enterMealTextController,
                                focusNode: _model.enterMealFocusNode,
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter here...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                minLines: 1,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model
                                    .enterMealTextControllerValidator
                                    .asValidator(context),
                              ),
                              FFButtonWidget(
                                key: ValueKey('Button_5zzo'),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'A_I_MEAL_PAGE_PAGE_GENERATE_BTN_ON_TAP');
                                  if (_model.enterMealTextController.text !=
                                      '') {
                                    logFirebaseEvent('Button_a_i_agent');
                                    await callAiAgent(
                                      context: context,
                                      prompt:
                                          _model.enterMealTextController.text,
                                      threadId: currentUserUid,
                                      agentCloudFunctionName: 'mealGenerator',
                                      provider: 'GOOGLE',
                                      agentJson:
                                          "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"mealGenerator\",\"key\":\"anbby\"},\"name\":\"mealGenerator\",\"description\":\"Takes an input message from a user on the type of meal they want generated and returns a meal with the name, calories, and ingredient list for the meal.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-1.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are an ai meal generator. suggest meals based on the users input. Generate a meal suggestion in JSON format with the following keys:\\n\\nname (string) → The meal name\\n\\ntype (string) → Either 'Breakfast', 'Lunch', 'Dinner', or 'Snack'\\n\\ncalories (integer) → The calorie count\\n\\ningredients (string) → A comma-separated list of ingredients\\nReturn the response as valid JSON.\\\"\\n{\\n  \\\"name\\\": \\\"Grilled Chicken Salad\\\",\\n  \\\"type\\\": \\\"Lunch\\\",\\n  \\\"calories\\\": 350,\\n  \\\"ingredients\\\": \\\"Chicken, Lettuce, Tomato, Olive oil, Feta cheese\\\"\\n}\\n\\n\"},{\"role\":\"USER\",\"text\":\"Give me a suggestion for a salad for dinner.\"},{\"role\":\"ASSISTANT\",\"text\":\"{\\n  \\\"name\\\": \\\"Grilled Chicken Salad\\\",\\n  \\\"type\\\": \\\"Dinner\\\",\\n  \\\"calories\\\": 350,\\n  \\\"ingredients\\\": \\\"Chicken, Lettuce, Tomato, Olive oil, Feta cheese\\\"\\n}\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                      responseType: 'JSON',
                                    ).then((generatedText) {
                                      safeSetState(() =>
                                          _model.aIResponse = generatedText);
                                    });

                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.mealResponse = _model.aIResponse;
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.mealName = getJsonField(
                                      _model.mealResponse,
                                      r'''$.name''',
                                    ).toString();
                                    _model.mealCalories = getJsonField(
                                      _model.aIResponse,
                                      r'''$.calories''',
                                    );
                                    _model.mealIngredients = getJsonField(
                                      _model.aIResponse,
                                      r'''$.ingredients''',
                                    ).toString();
                                    _model.recipeType = getJsonField(
                                      _model.aIResponse,
                                      r'''$.type''',
                                    ).toString();
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please Fill out Text Bar',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent('meals_generated');

                                  safeSetState(() {});
                                },
                                text: 'Generate',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsets.all(0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                child: Divider(
                  height: 1.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 12.0),
                child: Text(
                  'Generated Meal:',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  if (_model.mealName != null && _model.mealName != '')
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x15000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.mealName,
                                              'Meal Name',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: 80.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              _model.recipeType,
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.mealCalories?.toString(),
                                          'Meal Calories',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.mealIngredients,
                                          'Meal Ingredients',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    key: ValueKey('IconButton_e0ot'),
                                    borderRadius: 20.0,
                                    icon: Icon(
                                      Icons.add_circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'A_I_MEAL_PAGE_PAGE_add_circle_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      await MealsRecord.collection.doc().set({
                                        ...createMealsRecordData(
                                          mealName: _model.mealName,
                                          calories: _model.mealCalories,
                                          mealType: _model.recipeType,
                                          userId: currentUserUid,
                                          ingredients: _model.mealIngredients,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'createTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
