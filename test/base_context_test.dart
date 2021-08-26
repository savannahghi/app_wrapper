import 'package:app_wrapper/src/base_context.dart';
import 'package:test/test.dart';

void main() {
  group('BaseContext', () {
    test('should create valid instance of BaseContext', () {
      const BaseContext baseContext = BaseContext(
        graphqlEndpoint: 'graphqlEndpoint',
        loginByPhoneEndpoint: 'loginByPhoneEndpoint',
        uploadFileEndPoint: 'uploadFileEndPoint',
        pinResetEndpoint: 'pinResetEndpoint',
        updateUserPinEndpoint: 'updateUserPinEndpoint',
        verifyPhoneEndpoint: 'verifyPhoneEndpoint',
        createUserByPhoneEndpoint: 'createUserByPhoneEndpoint',
        retryResendOtpEndpoint: 'retryResendOtpEndpoint',
        refreshTokenEndpoint: 'refreshTokenEndpoint',
        anonymousLoginEndpoint: 'anonymousLoginEndpoint',
        userRecoveryPhoneNumbersEndpoint: 'userRecoveryPhoneNumbersEndpoint',
        sendRecoverAccountOtpEndpoint: 'sendRecoverAccountOtpEndpoint',
        setPrimaryPhoneNumberEndpoint: 'setPrimaryPhoneNumberEndpoint',
        sendContactVerificationOTPEndpoint:
            'sendContactVerificationOTPEndpoint',
        verifyContactOTPEndpoint: 'verifyContactOTPEndpoint',
      );

      expect(baseContext.graphqlEndpoint, 'graphqlEndpoint');
    });
  });
}
