import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sil_app_wrapper/sil_app_wrapper.dart';

typedef TraceLogType = void Function(
    {dynamic client,
    dynamic query,
    dynamic data,
    dynamic response,
    String title,
    String description,
    BuildContext context});

typedef SimpleCallType = Future<Map<String, dynamic>> Function(
    {dynamic graphClient,
    dynamic querystring,
    dynamic variables,
    BuildContext context});

Future<void> genericFetchFunction({
  @required StreamController<dynamic> streamController,
  @required BuildContext context,
  @required String queryString,
  @required Map<String, dynamic> variables,
  @required String logTitle,
  @required TraceLogType traceLogFunc,
  @required SimpleCallType simpleCallFunc,
  bool rawResponse,
}) async {
  // indicate processing onging on
  streamController.add(<String, dynamic>{'loading': true});

  /// fetch the data from the api
  Map<String, dynamic> response = await simpleCallFunc(
    context: context,
    querystring: queryString,
    variables: variables ?? <String, dynamic>{},
    graphClient: SILAppWrapperBase.of(context).graphQLClient,
  );

  traceLogFunc(
      client: SILAppWrapperBase.of(context).graphQLClient,
      query: queryString,
      data: variables ?? <String, dynamic>{},
      response: response,
      title: 'Get terms and conditionsile',
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
