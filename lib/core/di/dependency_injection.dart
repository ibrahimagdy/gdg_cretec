import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/forget_password/data/repo/forget_password_repo.dart';
import '../../features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/login/logic/login_cubit/login_cubit.dart';
import '../../features/auth/otp/data/repo/verify_otp_repo.dart';
import '../../features/auth/otp/logic/verify_otp_cubit.dart';
import '../../features/auth/reset_password/data/repo/reset_password_repo.dart';
import '../../features/auth/reset_password/logic/reset_password_cubit.dart';
import '../../features/auth/sign_up/data/repo/sign_up_repo.dart';
import '../../features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // sign up
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));

  // verify otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));

  // reset password
  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));

}
