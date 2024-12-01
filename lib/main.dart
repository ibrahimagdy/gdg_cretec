import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helpers/simple_bloc_observer.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'cretec.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  bool isFirstLaunch = await SharedPrefHelper.isFirstLaunch();
  bool isLoggedIn = isFirstLaunch ? false : await checkIfLoggedInUser();


  runApp(
    CretecApp(
      appRouter: AppRouter(),
      initialRoute: isFirstLaunch
          ? Routes.onBoardingScreen
          : (isLoggedIn ? Routes.appLayout : Routes.loginScreen),
    ),
  );

}

Future<bool> checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  return userToken != null && userToken.isNotEmpty;
}
