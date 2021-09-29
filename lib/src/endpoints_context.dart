import 'package:app_wrapper/app_wrapper.dart';

/// [EndpointContext] returns the correct server endpoint depending on the context
/// that the app is running on
class EndpointContext {
  static String getGraphQLEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdGraphqlEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoGraphqlEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eGraphqlEndpoint;
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

    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eLoginByPhoneEndpoint;
    }

    return kTestLoginByPhoneEndpoint;
  }

  static String uploadFileEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdUploadFileEndPoint;
    }

    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoUploadFileEndPoint;
    }

    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eUploadFileEndPoint;
    }

    return kTestUploadFileEndPoint;
  }

  static String resetPinResetEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdPinResetEndpoint;
    }
    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoPinResetEndpoint;
    }
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2ePinResetEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eUpdateUserPinEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eVerifyPhoneEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eCreateUserByPhoneEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eRetryResendOtpEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eRefreshTokenEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eAnonymousLoginEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eUserRecoveryPhoneNumbersEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eSendRecoverAccountOtpEndpoint;
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
    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eSetPrimaryPhoneNumberEndpoint;
    }
    return kTestSetPrimaryPhoneNumberEndpoint;
  }

  static String switchFlaggedFeaturesEndpoint(List<AppContext> contexts) {
    if (contexts.contains(AppContext.AppProd)) {
      return kProdSwitchFlaggedFeaturesEndpoint;
    }

    if (contexts.contains(AppContext.AppDemo)) {
      return kDemoSwitchFlaggedFeaturesEndpoint;
    }

    if (contexts.contains(AppContext.AppE2E)) {
      return ke2eSwitchFlaggedFeaturesEndpoint;
    }

    return kTestSwitchFlaggedFeaturesEndpoint;
  }
}
