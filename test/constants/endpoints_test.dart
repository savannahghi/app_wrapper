import 'package:flutter_test/flutter_test.dart';
import 'package:sil_app_wrapper/constants/endpoints.dart';
import 'package:sil_app_wrapper/models/enums/enums.dart';
import 'package:sil_app_wrapper/sil_app_wrapper.dart';

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

  test('test endpoints', () {
    // prod endpoints
    expect(
        EndpointContext.getGraphQLEndpoint(prodContext), kProdGraphqlEndpoint);

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

    // demo endpoints
    expect(
        EndpointContext.getGraphQLEndpoint(demoContext), kDemoGraphqlEndpoint);

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

    // test endpoints
    expect(
        EndpointContext.getGraphQLEndpoint(testContext), kTestGraphqlEndpoint);

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
  });
}
