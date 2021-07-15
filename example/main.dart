import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';

void main() {
  runApp(const YourAppName(
    appContexts: <AppContext>[],
  ));
}

/// [YourAppName] marks as the entry point to your application.
/// 
/// Wraps your app with [AppWrapper] class.
/// 
/// Takes in a list of appContexts (e.g `testAppContexts`, `demoAppContexts` or `prodAppContexts`)
/// [context] is the environment which the app is running on.
/// This can be different app `flavours` or environments (`prod`, `test`, `demo`)
class YourAppName extends StatelessWidget {
  const YourAppName({Key? key, required this.appContexts}) : super(key: key);

  final List<AppContext> appContexts;

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appName: 'appName',
      graphQLClient: SILGraphQlClient(
          'id_token', EndpointContext.getGraphQLEndpoint(appContexts)),
      appContexts: appContexts,
      child: Builder(
        builder: (BuildContext context) {
          return const MaterialApp(

              /// Entry point to your application
              );
        },
      ),
    );
  }
}
