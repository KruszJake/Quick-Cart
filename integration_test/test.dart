import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quick_cart/flutter_flow/flutter_flow_drop_down.dart';
import 'package:quick_cart/flutter_flow/flutter_flow_icon_button.dart';
import 'package:quick_cart/flutter_flow/flutter_flow_widgets.dart';
import 'package:quick_cart/flutter_flow/flutter_flow_theme.dart';
import 'package:quick_cart/index.dart';
import 'package:quick_cart/main.dart';
import 'package:quick_cart/flutter_flow/flutter_flow_util.dart';

import 'package:quick_cart/backend/firebase/firebase_config.dart';
import 'package:quick_cart/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Backend Management', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'raymond.oa@uri.edu', password: 'Raybrian77!');
    await tester.pumpWidget(const MyApp());
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(find.byKey(const ValueKey('mealName_grro')), 'Rice');
    await tester.tap(find.byKey(const ValueKey('addMeal_puij')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Your Meals'), findsWidgets);
  });

  testWidgets('Account Creation', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: HomePageWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 100000),
    );
    await tester.tap(find.byKey(const ValueKey('Button_g5od')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 100000),
    );
    await tester.enterText(
        find.byKey(const ValueKey('SignUp-Email_m7rc')), 'jake@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('SignUp-Password_qckj')), 'password');
    await tester.enterText(
        find.byKey(const ValueKey('SignUp-ConfirmPassword_7mys')), 'password');
    await tester.tap(find.byKey(const ValueKey('Button_zrj7')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 100000),
    );
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
