import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/utils.dart';

StepDefinitionGeneric pageLoaded() {
  return given1<String, FlutterWorld>("I am in {string} page",
      (key, context) async {
    final finder = find.byValueKey(key);
    await Future.delayed(const Duration(milliseconds: 1000));
    await isAppeared(context.world.driver!, finder);
  });
}
