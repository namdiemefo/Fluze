
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluze/core/cubits/account/account_cubit.dart';
import 'package:fluze/core/cubits/profile/profile_cubit.dart';
import 'package:fluze/ui/navigation/navigation_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';


@GenerateNiceMocks([MockSpec<NavigationManager>()])
import 'cubit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('cubit tests', () {
    late AccountCubit accountCubit;
    late ProfileCubit profileCubit;
    
    test('initial state is correct', () {
      expect(AccountCubit().state, AccountInitial());
      expect(ProfileCubit().state, ProfileInitial());
    });
    
    setUp(() {
      EquatableConfig.stringify = true;
      accountCubit = AccountCubit();
      profileCubit = ProfileCubit();
    });

    blocTest(
        'test account cubit',
        build: () => accountCubit,
        act: (cubit) => cubit.submit(email: '', name: ''),
        expect: () => [AccountSuccess()],
    );

    blocTest(
      'test profile cubit',
      build: () => profileCubit,
      act: (cubit) => cubit.getUser(),
      expect: () => [const ProfileWithUser('', '')],
    );

    tearDown(() {
      accountCubit.close();
    });

  });

  
}