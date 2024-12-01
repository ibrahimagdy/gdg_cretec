import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/forget_password/ui/forget_password_screen.dart';
import '../../features/auth/login/logic/login_cubit/login_cubit.dart';
import '../../features/auth/otp/logic/verify_otp_cubit.dart';
import '../../features/auth/reset_password/data/repo/reset_password_repo.dart';
import '../../features/auth/reset_password/logic/reset_password_cubit.dart';
import '../../features/auth/reset_password/ui/reset_password_screen.dart';
import '../../features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import '../../features/auth/sign_up/ui/sign_up_screen.dart';
import '../../features/layout/app_layout.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/profile/ui/screens/edit_profile_screen.dart';
import '../../features/profile/ui/screens/notifications_settings_screen.dart';
import '../../features/profile/ui/screens/privacy_policy_screen.dart';
import '../../features/profile/ui/screens/settings_screen.dart';
import '../di/dependency_injection.dart';
import '../network/api_service.dart';
import '/core/routing/routes.dart';
import '../../features/auth/otp/ui/otp_screen.dart';
import '../../features/auth/login/ui/login_screen.dart';

class AppRouter {

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: const OtpScreen(),
          ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetPasswordCubit(
              ResetPasswordRepo(getIt<ApiService>()),
            ),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => const AppLayout(),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
            UserProfileCubit(UserProfileRepo(getIt<ApiService>()))
              ..fetchUserProfile(),
            child: const EditProfileScreen(),
          ),
        );
      case Routes.settingsProfileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UserProfileCubit>(),
            child: const SettingsScreen(),
          ),
        );
      case Routes.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case Routes.notificationsSettingsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationsSettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
