import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetGametagCall {
  static Future<ApiCallResponse> call({
    String? gamertag = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetGametagCall',
        'variables': {
          'gamertag': gamertag,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? xuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.people[:].xuid''',
      ));
  static String? gamertag(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.people[:].gamertag''',
      ));
  static String? modernGamertag(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.people[:].modernGamertag''',
      ));
  static String? uniqueModernGamertag(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.people[:].uniqueModernGamertag''',
      ));
}

class ExchangeTokenCall {
  static Future<ApiCallResponse> call({
    String? region = 'us',
    String? grantType = 'authorization_code',
    String? code = '',
    String? redirectUri = 'https://gamewe.net/authcallback',
    String? clientId = '98630727b7b84746add335d281f0a31f',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ExchangeToken',
      apiUrl: 'https://oauth.battle.net/oauth/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer {token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBattleNetCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBattleNet',
      apiUrl: 'https://oauth.battle.net/userinfo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'access_token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AuthBattleNetCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'authBattleNet',
      apiUrl: 'https://oauth.battle.net/authorize',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'response_type': "code",
        'scope': "openid",
        'state': "AbCdEfG",
        'redirect_uri': "https://gamewe.net/authcallback",
        'client_id': "98630727b7b84746add335d281f0a31f",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBattleNetTokenCall {
  static Future<ApiCallResponse> call({
    String? code = '',
    String? grantType = 'authorization_code',
    String? clientId = '98630727b7b84746add335d281f0a31f',
    String? clientSecret = 'tHiQLEFn4mUnuY67qxoU4pfgUeGLcVnF',
    String? redirectUri = 'https://gamewe.net/authcallback',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBattleNetToken',
      apiUrl: 'https://oauth.battle.net/oauth/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'basic OTg2MzA3MjdiN2I4NDc0NmFkZDMzNWQyODFmMGEzMWY6dEhpUUxFRm40bVVudVk2N3F4b1U0cGZnVWVHTGNWbkY=',
      },
      params: {
        'grant_type': grantType,
        'code': code,
        'redirect_uri': redirectUri,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
