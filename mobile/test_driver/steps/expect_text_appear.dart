import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/utils.dart';

StepDefinitionGeneric expectElementAppeared() {
  return then2<String, String, FlutterWorld>(
      "I should see value {string} appear in {string}",
      (text, key, context) async {
    final finder = find.descendant(
      of: find.byValueKey(key),
      matching: find.text(text),
      matchRoot: true,
    );
    // final found = await context.world.driver!.getText(finder);
    context.expect(finder, text);
  });
}
