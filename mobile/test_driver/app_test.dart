import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/app_load.dart';
import 'steps/chill_out.dart';
import 'steps/element_load.dart';
import 'steps/enter_text.dart';
import 'steps/expect_element_appear.dart';
import 'steps/expect_text_appear.dart';
import 'steps/open_app.dart';
import 'steps/page_load.dart';
import 'steps/tap.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"features/*.feature")]
    ..stepDefinitions = [
      appLoad(),
      elementLoaded(),
      chill(),
      enterText(),
      pageLoaded(),
      expectElementAppeared(),
      expectTextAppeared(),
      openApp(),
      tap(),
    ]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
      FlutterDriverReporter(
        logErrorMessages: true,
        logInfoMessages: true,
        logWarningMessages: true,
      ),
    ]
    ..hooks = [
      AttachScreenshotOnFailedStepHook(), // takes a screenshot of each step failure and attaches it to the world object
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppWorkingDirectory = './'
    ..targetAppPath = "test_driver/app.dart"
    // ..buildFlavor = "staging" // uncomment when using build flavor and check android/ios flavor setup see android file android\app\build.gradle
    // ..targetDeviceId = 'all' // uncomment to run tests on all connected devices or set specific device target id
    // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
    ..logFlutterProcessOutput =
        true; // uncomment to see command invoked to start the flutter test app
  // ..verboseFlutterProcessLogs = true // uncomment to see the verbose output from the Flutter process
  // ..flutterBuildTimeout = Duration(minutes: 3) // uncomment to change the default period that flutter is expected to build and start the app within
  return GherkinRunner().execute(config);
}
