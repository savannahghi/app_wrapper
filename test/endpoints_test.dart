import 'package:flutter_test/flutter_test.dart';
import 'package:app_wrapper/app_wrapper.dart';

void main() {
  final List<AppContext> prodContext = <AppContext>[
    AppContext.BewellPRO,
    AppContext.AppProd,
    AppContext.AppDemo
  ];

  final List<AppContext> demoContext = <AppContext>[
    AppContext.BewellPRO,
    AppContext.AppDemo
  ];

  final List<AppContext> testContext = <AppContext>[
    AppContext.BewellPRO,
    AppContext.AppTest
  ];

  final List<AppContext> e2eContext = <AppContext>[
    AppContext.BewellPRO,
    AppContext.AppE2E
  ];

  group('test endpoints', () {
    test('prod endpoints', () {
      expect(EndpointContext.getGraphQLEndpoint(prodContext),
          kProdGraphqlEndpoint);

      expect(EndpointContext.loginByPhoneEndpoint(prodContext),
          kProdLoginByPhoneEndpoint);

      expect(EndpointContext.resetPinResetEndpoint(prodContext),
          kProdPinResetEndpoint);

      expect(EndpointContext.updateUserPinEndpoint(prodContext),
          kProdUpdateUserPinEndpoint);

      expect(EndpointContext.verifyPhoneEndpoint(prodContext),
          kProdVerifyPhoneEndpoint);

      expect(EndpointContext.createUserByPhoneEndpoint(prodContext),
          kProdCreateUserByPhoneEndpoint);

      expect(EndpointContext.retrySendOtpEndpoint(prodContext),
          kProdRetryResendOtpEndpoint);

      expect(EndpointContext.refreshTokenEndpoint(prodContext),
          kProdRefreshTokenEndpoint);

      expect(EndpointContext.anonymousLoginEndpoint(prodContext),
          kProdAnonymousLoginEndpoint);

      expect(EndpointContext.userRecoveryPhoneNumbers(prodContext),
          kProdUserRecoveryPhoneNumbersEndpoint);

      expect(EndpointContext.sendRecoverAccountOTP(prodContext),
          kProdSendRecoverAccountOtpEndpoint);

      expect(EndpointContext.setPrimaryPhoneNumber(prodContext),
          kProdSetPrimaryPhoneNumberEndpoint);

      expect(EndpointContext.uploadFileEndpoint(prodContext),
          kProdUploadFileEndPoint);

      expect(EndpointContext.sendContactVerificationOTP(prodContext),
          kProdSendContactVerificationOTPEndpoint);

      expect(EndpointContext.verifyContactOTP(prodContext),
          kProdVerifyContactOTPEndpoint);
    });

    test('demo endpoints', () {
      expect(EndpointContext.getGraphQLEndpoint(demoContext),
          kDemoGraphqlEndpoint);

      expect(EndpointContext.loginByPhoneEndpoint(demoContext),
          kDemoLoginByPhoneEndpoint);

      expect(EndpointContext.resetPinResetEndpoint(demoContext),
          kDemoPinResetEndpoint);

      expect(EndpointContext.updateUserPinEndpoint(demoContext),
          kDemoUpdateUserPinEndpoint);

      expect(EndpointContext.verifyPhoneEndpoint(demoContext),
          kDemoVerifyPhoneEndpoint);

      expect(EndpointContext.createUserByPhoneEndpoint(demoContext),
          kDemoCreateUserByPhoneEndpoint);

      expect(EndpointContext.retrySendOtpEndpoint(demoContext),
          kDemoRetryResendOtpEndpoint);

      expect(EndpointContext.refreshTokenEndpoint(demoContext),
          kDemoRefreshTokenEndpoint);

      expect(EndpointContext.anonymousLoginEndpoint(demoContext),
          kDemoAnonymousLoginEndpoint);

      expect(EndpointContext.userRecoveryPhoneNumbers(demoContext),
          kDemoUserRecoveryPhoneNumbersEndpoint);

      expect(EndpointContext.sendRecoverAccountOTP(demoContext),
          kDemoSendRecoverAccountOtpEndpoint);

      expect(EndpointContext.setPrimaryPhoneNumber(demoContext),
          kDemoSetPrimaryPhoneNumberEndpoint);

      expect(EndpointContext.uploadFileEndpoint(demoContext),
          kDemoUploadFileEndPoint);

      expect(EndpointContext.sendContactVerificationOTP(demoContext),
          kDemoSendContactVerificationOTPEndpoint);

      expect(EndpointContext.verifyContactOTP(demoContext),
          kDemoVerifyContactOTPEndpoint);
    });

    test('test endpoints', () {
      expect(EndpointContext.getGraphQLEndpoint(testContext),
          kTestGraphqlEndpoint);

      expect(EndpointContext.loginByPhoneEndpoint(testContext),
          kTestLoginByPhoneEndpoint);

      expect(EndpointContext.resetPinResetEndpoint(testContext),
          kTestPinResetEndpoint);

      expect(EndpointContext.updateUserPinEndpoint(testContext),
          kTestUpdateUserPinEndpoint);

      expect(EndpointContext.verifyPhoneEndpoint(testContext),
          kTestVerifyPhoneEndpoint);

      expect(EndpointContext.createUserByPhoneEndpoint(testContext),
          kTestCreateUserByPhoneEndpoint);

      expect(EndpointContext.retrySendOtpEndpoint(testContext),
          kTestRetryResendOtpEndpoint);

      expect(EndpointContext.refreshTokenEndpoint(testContext),
          kTestRefreshTokenEndpoint);

      expect(EndpointContext.anonymousLoginEndpoint(testContext),
          kTestAnonymousLoginEndpoint);

      expect(EndpointContext.userRecoveryPhoneNumbers(testContext),
          kTestUserRecoveryPhoneNumbersEndpoint);

      expect(EndpointContext.sendRecoverAccountOTP(testContext),
          kTestSendRecoverAccountOtpEndpoint);

      expect(EndpointContext.setPrimaryPhoneNumber(testContext),
          kTestSetPrimaryPhoneNumberEndpoint);

      expect(EndpointContext.uploadFileEndpoint(testContext),
          kTestUploadFileEndPoint);

      expect(EndpointContext.sendContactVerificationOTP(testContext),
          kTestSendContactVerificationOTPEndpoint);

      expect(EndpointContext.verifyContactOTP(testContext),
          kTestVerifyContactOTPEndpoint);
    });

    test('e2e endpoints', () {
      expect(
          EndpointContext.getGraphQLEndpoint(e2eContext), ke2eGraphqlEndpoint);

      expect(EndpointContext.loginByPhoneEndpoint(e2eContext),
          ke2eLoginByPhoneEndpoint);

      expect(EndpointContext.resetPinResetEndpoint(e2eContext),
          ke2ePinResetEndpoint);

      expect(EndpointContext.updateUserPinEndpoint(e2eContext),
          ke2eUpdateUserPinEndpoint);

      expect(EndpointContext.verifyPhoneEndpoint(e2eContext),
          ke2eVerifyPhoneEndpoint);

      expect(EndpointContext.createUserByPhoneEndpoint(e2eContext),
          ke2eCreateUserByPhoneEndpoint);

      expect(EndpointContext.retrySendOtpEndpoint(e2eContext),
          ke2eRetryResendOtpEndpoint);

      expect(EndpointContext.refreshTokenEndpoint(e2eContext),
          ke2eRefreshTokenEndpoint);

      expect(EndpointContext.anonymousLoginEndpoint(e2eContext),
          ke2eAnonymousLoginEndpoint);

      expect(EndpointContext.userRecoveryPhoneNumbers(e2eContext),
          ke2eUserRecoveryPhoneNumbersEndpoint);

      expect(EndpointContext.sendRecoverAccountOTP(e2eContext),
          ke2eSendRecoverAccountOtpEndpoint);

      expect(EndpointContext.setPrimaryPhoneNumber(e2eContext),
          ke2eSetPrimaryPhoneNumberEndpoint);

      expect(EndpointContext.uploadFileEndpoint(e2eContext),
          ke2eUploadFileEndPoint);
    });
  });
}
