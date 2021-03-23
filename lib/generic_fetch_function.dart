import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sil_app_wrapper/sil_app_wrapper_base.dart';
import 'package:sil_graphql_client/graph_client.dart';

typedef TraceLogType = void Function(
    {required ISILGraphQlClient client,
    dynamic query,
    dynamic data,
    dynamic response,
    required String title,
    String? description,
    required BuildContext context});

typedef SimpleCallType = Future<Map<String, dynamic>> Function(
    {required ISILGraphQlClient graphClient,
    String queryString,
    dynamic variables,
    required BuildContext context});

Future<void> genericFetchFunction({
  required StreamController<dynamic> streamController,
  required BuildContext context,
  required String queryString,
  Map<String, dynamic>? variables,
  required String logTitle,
  required TraceLogType traceLogFunc,
  required SimpleCallType simpleCallFunc,
  bool? rawResponse,
}) async {
  // indicate processing going on
  streamController.add(<String, dynamic>{'loading': true});

  /// fetch the data from the api
  final Map<String, dynamic> response = await simpleCallFunc(
    context: context,
    queryString: queryString,
    variables: variables,
    graphClient: SILAppWrapperBase.of(context)!.graphQLClient,
  );

  traceLogFunc(
      client: SILAppWrapperBase.of(context)!.graphQLClient,
      query: queryString,
      data: variables,
      response: response,
      title: 'Get terms and conditions',
      description: 'Get terms and conditions',
      context: context);

  // /// check if the response has timeout metadata. If yes, return an error to
  // /// handled correctly
  if (response['statusCode'] == 408) {
    streamController.addError(<String, dynamic>{'error': 'timeout'});
    return Future<dynamic>.value();
  }

  // // check for errors in the data here
  if (response['error'] != null) {
    streamController.addError(<String, dynamic>{'error': response['error']});
    return Future<dynamic>.value();
  }

  streamController.add(response);
}
