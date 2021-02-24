library sil_app_wrapper;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sil_app_wrapper/constants/endpoints.dart';
import 'package:sil_app_wrapper/models/enums/enums.dart';
import 'package:sil_graphql_client/sil_graphql_client.dart';
import 'package:sil_http_client/sil_http_client.dart';

class SILAppWrapper extends StatefulWidget {
  /// [child] the widget that will be wrapped by this wrapper
  final Widget child;

  /// [appName] the name os the app
  final String appName;

  /// Used to send events to the backend
  final dynamic eventBus;

  /// [graphQLClient] is the graphql client from sil_graphql_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final SILGraphQlClient graphQLClient;

  /// [httpClient] is the http client from sil_http_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final SILHttpClient httpClient;

  /// [context] is the environment which the app is running on. In app can run
  /// on multiple contexts, the intuition why [context] is a list.
  /// example of contexts;
  ///
  /// BewellCONSUMER
  /// BewellPRO
  ///
  /// An app should have at least one context
  final List<AppContext> context;

  SILAppWrapper({
    @required this.child,
    @required this.appName,
    @required this.graphQLClient,
    @required this.httpClient,
    @required this.context,
    this.eventBus,
  })  : assert(context != null),
        assert(context.isNotEmpty);

  @override
  SILAppWrapperState createState() => SILAppWrapperState();
}

class SILAppWrapperState extends State<SILAppWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: Key('sil_app_wrapper'),
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return SILAppWrapperBase(
          eventBus: widget.eventBus,
          appName: widget.appName,
          graphQLClient: widget.graphQLClient,
          httpClient: widget.httpClient,
          child: widget.child,
          context: widget.context,
        );
      },
    );
  }
}

class SILAppWrapperBase extends InheritedWidget {
  final bool shouldNotify;
  final String appName;
  final dynamic eventBus;

  /// [graphQLClient] is the graphql client from sil_graphql_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final SILGraphQlClient graphQLClient;

  /// [httpClient] is the http client from sil_http_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final SILHttpClient httpClient;

  /// [context] is the app running environments
  final List<AppContext> context;

  SILAppWrapperBase({
    Widget child,
    @required this.graphQLClient,
    @required this.httpClient,
    @required this.appName,
    @required this.context,
    this.eventBus,
    this.shouldNotify = true,
  })  : assert(context != null),
        assert(context.isNotEmpty),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => shouldNotify;

  static SILAppWrapperBase of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SILAppWrapperBase>();

  DeviceCapabilities get deviceCapabilities => DeviceCapabilities();

  DeviceScreenType deviceScreenType(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > 950) {
      return DeviceScreenType.Desktop;
    } else if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    } else {
      return DeviceScreenType.Mobile;
    }
  }
}

class DeviceCapabilities {
  static final DeviceCapabilities _singleton = DeviceCapabilities._internal();

  factory DeviceCapabilities() {
    return _singleton;
  }

  DeviceCapabilities._internal();

  Future<List<BiometricType>> checkBiometrics(
      LocalAuthentication localAuthentication) async {
    final List<BiometricType> availableBiometrics =
        await localAuthentication.getAvailableBiometrics();
    return availableBiometrics;
  }

// check if cameras are available in the device. if no cameras
// are available then the microphone is not available and vice versa
  Future<bool> checkCameras(CameraWrapper wrapper) async {
    final List<CameraDescription> cameras = await wrapper.cameras;
    if (cameras.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<List<CameraDescription>> getCameras(CameraWrapper wrapper) async {
    final List<CameraDescription> cameras = await wrapper.cameras;
    if (cameras.isEmpty) {
      return null;
    }
    return cameras;
  }
}

class CameraWrapper {
  static final CameraWrapper _singleton = CameraWrapper._internal();

  factory CameraWrapper() {
    return _singleton;
  }

  CameraWrapper._internal();

  Future<List<CameraDescription>> get cameras async {
    final List<CameraDescription> cameras = await availableCameras();
    return cameras;
  }
}

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
