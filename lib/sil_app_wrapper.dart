library sil_app_wrapper;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sil_app_wrapper/device_capabilities.dart';

import 'package:sil_app_wrapper/models/enums/enums.dart';
import 'package:sil_app_wrapper/sil_app_wrapper_base.dart';
import 'package:sil_graphql_client/graph_client.dart';

class SILAppWrapper extends StatefulWidget {
  const SILAppWrapper({
    required this.child,
    required this.appName,
    required this.graphQLClient,
    required this.appContexts,
    this.eventBus,
  });

  /// [child] the widget that will be wrapped by this wrapper
  final Widget child;

  /// [appName] the name os the app
  final String appName;

  /// Used to send events to the backend
  final dynamic eventBus;

  /// [graphQLClient] is the graphql client from sil_graphql_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final ISILGraphQlClient graphQLClient;

  /// [context] is the environment which the app is running on. In app can run
  /// on multiple contexts, the intuition why [context] is a list.
  /// example of contexts;
  ///
  /// BewellCONSUMER
  /// BewellPRO
  ///
  /// An app should have at least one context
  final List<AppContext> appContexts;

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
      key: const Key('sil_app_wrapper'),
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return SILAppWrapperBase(
          appName: widget.appName,
          eventBus: widget.eventBus,
          graphQLClient: widget.graphQLClient,
          appContexts: widget.appContexts,
          deviceCapabilities: DeviceCapabilities(),
          child: widget.child,
        );
      },
    );
  }
}
