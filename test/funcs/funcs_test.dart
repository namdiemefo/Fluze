import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluze/data/storage/shared_prefs.dart';
import 'package:fluze/helpers/utils/funcs.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<AppFunctions>(), MockSpec<AppStorage>()])
import 'funcs_test.mocks.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('function tests', () {
    late MockAppStorage mockAppStorage;
    late MockAppFunctions mockAppFunctions;

    setUp(() {
      mockAppStorage = MockAppStorage();
      mockAppFunctions = MockAppFunctions();
    });

    test('get user from storage', () {
      mockAppStorage.getUserData();
      verify(mockAppStorage.getUserData()).called(1);
    });

    test('save user to storage', () {
      mockAppStorage.saveUserData(email: '', name: 'bitcoin');
      verify(mockAppStorage.saveUserData(email: '', name: 'bitcoin')).called(1);
    });

    test('sequence validation', () {
      expect(mockAppFunctions.validateSequence('1122'), false);
    });

    test('repetition validation', () {
      expect(mockAppFunctions.validateRepetition('113122'), false);
    });

    test('email validation', () {
      expect(mockAppFunctions.validateEmail('nnaemefo@gmail.com'), false);
    });

  });


}