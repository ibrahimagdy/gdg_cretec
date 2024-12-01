import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/forget_password/data/model/forget_password_request_model.dart';
import '../../features/auth/forget_password/data/model/forget_password_response_model.dart';
import '../../features/auth/login/data/model/login_request_body.dart';
import '../../features/auth/login/data/model/login_response_body.dart';
import '../../features/auth/otp/data/models/verify_otp_request_model.dart';
import '../../features/auth/otp/data/models/verify_otp_response_model.dart';
import '../../features/auth/reset_password/data/models/reset_password_request_model.dart';
import '../../features/auth/reset_password/data/models/reset_password_response_model.dart';
import '../../features/auth/sign_up/data/model/sign_up_request_body.dart';
import '../../features/auth/sign_up/data/model/sign_up_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Authentication APIs
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponseModel> verifyOtp(
    @Body() VerifyOtpRequestModel verifyOtpRequestModel,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
    @Body() ResetPasswordRequestModel resetPasswordRequestModel,
  );

}
