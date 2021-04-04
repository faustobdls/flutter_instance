import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instance/src/inject.dart';
import 'package:instance/src/module.dart';

class Controller {
  final String text = "text";
}

class MainModule extends Module {
  @override
  Widget builder(i) => Scaffold(
        appBar: AppBar(),
        body: Text(i<Controller>().text),
      );

  @override
  List<Inject> get injects => [
        Inject<Controller>((i) => Controller()),
      ];
}

main() {
  group("Module Test", () {
    testWidgets("Start Module", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MainModule(),
      ));

      expect(find.byType(MainModule), findsOneWidget);
      expect(find.widgetWithText(Scaffold, "text"), findsOneWidget);
    });
  });
}
