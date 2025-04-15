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

  testWidgets('Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LogInWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(
      const Duration(milliseconds: 3000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    await tester.tap(find.byKey(const ValueKey('LogIn-email_u57v')));
    await tester.enterText(
        find.byKey(const ValueKey('LogIn-email_u57v')), 'nmartin893@uri.edu');
    await tester.pumpAndSettle(
      const Duration(milliseconds: 3000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    await tester.tap(find.byKey(const ValueKey('LogIn-Password_njd6')));
    await tester.enterText(
        find.byKey(const ValueKey('LogIn-Password_njd6')), '123456');
    await tester.pumpAndSettle(
      const Duration(milliseconds: 3000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    await tester.tap(find.byKey(const ValueKey('Button_u6ae')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 3000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    expect(find.text('Meal'), findsWidgets);
  });

  testWidgets('AI meal ', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'alejandro.gutierrez1176@gmail.com', password: 'alejandro11');
    await tester.pumpWidget(MyApp(
      entryPage: AIMealPageWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 15000));
    await tester.tap(find.byKey(const ValueKey('Button_5zzo')));
    await tester.pumpAndSettle(const Duration(milliseconds: 15000));
    await tester.enterText(find.byKey(const ValueKey('enterMeal_26n2')),
        'make a meal for breakfast');
    await tester.pumpAndSettle(const Duration(milliseconds: 15000));
    await tester.tap(find.byKey(const ValueKey('IconButton_e0ot')));
    await tester.pumpAndSettle(const Duration(milliseconds: 15000));
    await tester.tap(find.byIcon(Icons.add_box));
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
