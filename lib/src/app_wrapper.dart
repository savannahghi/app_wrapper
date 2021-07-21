library app_wrapper;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';

/// [AppWrapper] Is a top level Class used to wrap your application.
///
/// @params
/// - `child` the widget that will be wrapped by this wrapper
/// - `appName` A required string that identifies your application
/// - `graphQLClient` An instance of [ISILGraphQlClient] which is the blueprint of a valid GraphQL client.
/// - `appContexts` [context] app running environments.
/// - `eventBus` Used to log events
class AppWrapper extends StatefulWidget {
  const AppWrapper({
    required this.child,
    required this.appName,
    required this.graphQLClient,
    required this.appContexts,
    this.eventBus,
  });

  /// [child] the widget that will be wrapped by this wrapper
  final Widget child;

  /// [appName] the name of the app
  final String appName;

  /// Used to send events to the backend
  final dynamic eventBus;

  /// [graphQLClient] is the graphql client from flutter_graphql_client package
  /// it is dynamic to avoid cyclic-dependency errors when packages
  /// cross depend on each other
  final IGraphQlClient graphQLClient;

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
  AppWrapperState createState() => AppWrapperState();
}

class AppWrapperState extends State<AppWrapper> {
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
        return AppWrapperBase(
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
