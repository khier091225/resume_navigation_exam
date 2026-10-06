import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:resume_navigation_exam/main.dart';

void main() {
  testWidgets('Home destinations and back controls work on a small phone', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(320, 568);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MyResumeApp());
    await tester.pumpAndSettle();

    final destinations = {
      'VIEW RESUME DETAILS': 'Resume Details',
      'SKILLS & PROJECTS': 'Skills & Projects',
      'CERTIFICATES & TRAINING': 'Certificates & Training',
    };
    for (final destination in destinations.entries) {
      await tester.ensureVisible(find.text(destination.key));
      await tester.pumpAndSettle();
      await tester.tap(find.text(destination.key));
      await tester.pumpAndSettle();
      expect(find.text(destination.value), findsOneWidget);
      await tester.ensureVisible(find.text('BACK TO HOME'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('BACK TO HOME'));
      await tester.pumpAndSettle();
      expect(find.text('My Resume'), findsOneWidget);
    }

    await tester.ensureVisible(find.text('CERTIFICATES & TRAINING'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CERTIFICATES & TRAINING'));
    await tester.pumpAndSettle();
    expect(find.text('Completed Training'), findsOneWidget);
    expect(find.text('Completed'), findsNWidgets(7));
    expect(find.text('Certificate of Completion'), findsNWidgets(2));
    expect(find.text('Completed: February 2026'), findsOneWidget);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text('My Resume'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Training content scrolls without overflow with larger text', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(320, 568);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.6)),
          child: child!,
        ),
        home: const CertificatesTrainingScreen(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Mobile Application Development'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('BACK TO HOME'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
