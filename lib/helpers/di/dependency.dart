import 'package:get_it/get_it.dart';

import '../../ui/navigation/navigation_manager.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<NavigationManager>(() => NavigationManager());
}