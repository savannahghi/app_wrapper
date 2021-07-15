import 'package:flutter/widgets.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';

/// [AppWrapperBase] is a top level base class used to efficiently propagate information down the tree. 
/// 
/// It extends [InheritedWidget] and provides consumers with additional data about the device the apps are running on.
/// 
/// Consumers will rebuild when the state of this widget changes.
///
/// @params
/// - `graphQLClient` An instance of [ISILGraphQlClient] which is the blueprint of a valid GraphQL client.
/// It provides out of the box implementation of client methods that can be overridden.
/// - `appName` A required string that identifies your application.
/// - `appContexts` [context] app running environments.
/// - `deviceCapabilities` An instance of [IDeviceCapabilities] that is used to check for Device Camera 
/// and Device BiometricType (face or fingerprint).
/// - `eventBus` Used to log events
/// - `shouldNotify` bool used to determine whether the framework should notify widgets that inherit from this widget.
/// This parameter is set to true by default.
class AppWrapperBase extends InheritedWidget {
  const AppWrapperBase({
    required Widget child,
    required this.graphQLClient,
    required this.appName,
    required this.appContexts,
    required this.deviceCapabilities,
    this.eventBus,
    this.shouldNotify = true,
  }) : super(child: child);

  final bool shouldNotify;
  final String appName;
  final dynamic eventBus;

  final IDeviceCapabilities deviceCapabilities;

  /// [graphQLClient] is the graphql client from flutter_graphql_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final ISILGraphQlClient graphQLClient;

  /// [context] is the app running environments
  final List<AppContext> appContexts;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => shouldNotify;

  static AppWrapperBase? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppWrapperBase>();
}
