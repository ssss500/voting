import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RegisterNewUserCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String email = '',
    String phone = '',
    String password = '',
    String passwordConfirmation = '',
  }) {
    final body = '''
{
  "Name": "admintest",
  "email": "test@test.com",
  "password": "test123",
  "password_confirmation": "test123"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register new user',
      apiUrl: ' https://taswit.khaledibnalwalid.com/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic password(dynamic response) => getJsonField(
        response,
        r'''$.password''',
      );
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String email = '',
    String password = '',
  }) {
    final body = '''
[]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: ' https://taswit.khaledibnalwalid.com/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'Email': email,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic password(dynamic response) => getJsonField(
        response,
        r'''$.password''',
      );
}

class LogoutCall {
  static Future<ApiCallResponse> call() {
    final body = '''
[]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: ' https://taswit.khaledibnalwalid.com/api/logout',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ListAvailableVotesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'List available votes',
      apiUrl: 'https://taswit.khaledibnalwalid.com/api/vote-list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class VoteDetailsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Vote details',
      apiUrl: ' https://taswit.khaledibnalwalid.com/api/vote/{{ID}}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class ResendFaCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Resend fa',
      apiUrl: ' https://taswit.khaledibnalwalid.com/api/2fa/reset',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        'laravel_session': 'jFZ6QHPMRAJtiA5plqTHwFHwHRDHUKKkJI6IifqE',
      },
      params: {},
      returnBody: true,
    );
  }
}

class SubmitFaCodeCall {
  static Future<ApiCallResponse> call({
    int code = 1234,
  }) {
    final body = '''
[]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Submit fa code',
      apiUrl: 'https://taswit.khaledibnalwalid.com/api/2fa',
      callType: ApiCallType.POST,
      headers: {
        'laravel_session': 'jFZ6QHPMRAJtiA5plqTHwFHwHRDHUKKkJI6IifqE',
      },
      params: {
        'code': code,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
