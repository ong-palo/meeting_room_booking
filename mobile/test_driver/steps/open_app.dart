import "package:flutter_driver/flutter_driver.dart";
import "package:flutter_gherkin/flutter_gherkin.dart";
import "package:gherkin/gherkin.dart";

StepDefinitionGeneric openApp() {
  return given<FlutterWorld>("I open the app", (context) async {
    // ignore: avoid_print
    print("Open app");
    context.world.restartApp();
  });
}
