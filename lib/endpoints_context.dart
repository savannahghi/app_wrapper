import 'package:sil_app_wrapper/constants/endpoints.dart';
import 'package:sil_app_wrapper/models/enums/enums.dart';

/// '[EndpointContext] returns the correct server endpoint depending on the context
/// that the app is running on
class EndpointContext {
  static String getGraphQLEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdGraphqlEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoGraphqlEndpoint;
    }
    return kTestGraphqlEndpoint;
  }

  static String loginByPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdLoginByPhoneEndpoint;
    }

    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoLoginByPhoneEndpoint;
    }
    return kTestLoginByPhoneEndpoint;
  }

  static String resetPinResetEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdPinResetEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoPinResetEndpoint;
    }
    return kTestPinResetEndpoint;
  }

  static String updateUserPinEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUpdateUserPinEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoUpdateUserPinEndpoint;
    }
    return kTestUpdateUserPinEndpoint;
  }

  static String verifyPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdVerifyPhoneEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoVerifyPhoneEndpoint;
    }
    return kTestVerifyPhoneEndpoint;
  }

  static String createUserByPhoneEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdCreateUserByPhoneEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoCreateUserByPhoneEndpoint;
    }
    return kTestCreateUserByPhoneEndpoint;
  }

  static String retrySendOtpEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdRetryResendOtpEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoRetryResendOtpEndpoint;
    }
    return kTestRetryResendOtpEndpoint;
  }

  static String refreshTokenEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdRefreshTokenEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoRefreshTokenEndpoint;
    }
    return kTestRefreshTokenEndpoint;
  }

  static String anonymousLoginEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdAnonymousLoginEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoAnonymousLoginEndpoint;
    }
    return kTestAnonymousLoginEndpoint;
  }

  static String userRecoveryPhoneNumbers(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUserRecoveryPhoneNumbersEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoUserRecoveryPhoneNumbersEndpoint;
    }
    return kTestUserRecoveryPhoneNumbersEndpoint;
  }

  static String sendRecoverAccountOTP(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSendRecoverAccountOtpEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoSendRecoverAccountOtpEndpoint;
    }
    return kTestSendRecoverAccountOtpEndpoint;
  }

  static String setPrimaryPhoneNumber(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSetPrimaryPhoneNumberEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoSetPrimaryPhoneNumberEndpoint;
    }
    return kTestSetPrimaryPhoneNumberEndpoint;
  }
}
