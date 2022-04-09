class BaseContext {
  const BaseContext({
    required this.graphqlEndpoint,
    required this.loginByPhoneEndpoint,
    required this.uploadFileEndPoint,
    required this.pinResetEndpoint,
    required this.requestPinResetEndpoint,
    required this.respondedSecurityQuestionsEndpoint,
    required this.verifySecurityQuestionsEndpoint,
    required this.updateUserPinEndpoint,
    required this.verifyPhoneEndpoint,
    required this.createUserByPhoneEndpoint,
    required this.retryResendOtpEndpoint,
    required this.refreshTokenEndpoint,
    required this.refreshStreamTokenEndpoint,
    required this.anonymousLoginEndpoint,
    required this.userRecoveryPhoneNumbersEndpoint,
    required this.sendRecoverAccountOtpEndpoint,
    required this.setPrimaryPhoneNumberEndpoint,
    required this.sendContactVerificationOTPEndpoint,
    required this.verifyContactOTPEndpoint,
    required this.switchFlaggedFeaturesEndpoint,
    required this.pinResetServiceRequestEndpoint,
    required this.optInClientEndpoint,
  });

  final String graphqlEndpoint;
  final String loginByPhoneEndpoint;
  final String uploadFileEndPoint;
  final String pinResetEndpoint;
  final String? requestPinResetEndpoint;
  final String? respondedSecurityQuestionsEndpoint;
  final String? verifySecurityQuestionsEndpoint;
  final String updateUserPinEndpoint;
  final String verifyPhoneEndpoint;
  final String createUserByPhoneEndpoint;
  final String retryResendOtpEndpoint;
  final String refreshTokenEndpoint;
  final String refreshStreamTokenEndpoint;
  final String anonymousLoginEndpoint;
  final String userRecoveryPhoneNumbersEndpoint;
  final String sendRecoverAccountOtpEndpoint;
  final String setPrimaryPhoneNumberEndpoint;
  final String sendContactVerificationOTPEndpoint;
  final String verifyContactOTPEndpoint;
  final String switchFlaggedFeaturesEndpoint;
  final String pinResetServiceRequestEndpoint;
  final String optInClientEndpoint;
}
