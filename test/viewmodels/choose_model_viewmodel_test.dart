import 'package:flutter_test/flutter_test.dart';
import 'package:ollama/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ChooseModelViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}