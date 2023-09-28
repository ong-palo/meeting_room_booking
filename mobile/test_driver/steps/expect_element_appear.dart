import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/utils.dart';

StepDefinitionGeneric expectElementAppeared() {
  return then1<String, FlutterWorld>("I should see {string}",
      (key, context) async {
    final finder = find.byValueKey(key);
    await Future.delayed(const Duration(milliseconds: 3000));
    await isAppeared(context.world.driver!, finder);
  });
}
