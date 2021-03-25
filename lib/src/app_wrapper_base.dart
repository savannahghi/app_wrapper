import 'package:flutter/widgets.dart';
import 'package:sil_app_wrapper/sil_app_wrapper.dart';

import 'package:sil_graphql_client/graph_client.dart';

class SILAppWrapperBase extends InheritedWidget {
  const SILAppWrapperBase({
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

  /// [graphQLClient] is the graphql client from sil_graphql_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final ISILGraphQlClient graphQLClient;

  /// [context] is the app running environments
  final List<AppContext> appContexts;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => shouldNotify;

  static SILAppWrapperBase? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SILAppWrapperBase>();

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
