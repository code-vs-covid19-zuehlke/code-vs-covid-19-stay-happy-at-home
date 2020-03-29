import 'dart:convert';

import 'package:http/http.dart';

class LogClient extends BaseClient {
  LogClient(this.delegate);

  final Client delegate;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    _logRequest(request);
    return delegate.send(request);
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    final response = super.head(url, headers: headers);
    _logResponse(response);
    return response;
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    final response = super.get(url, headers: headers);
    _logResponse(response);
    return response;
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    final response = super.post(url, headers: headers, body: body, encoding: encoding);
    _logResponse(response);
    return response;
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    final response = super.put(url, headers: headers, body: body, encoding: encoding);
    _logResponse(response);
    return response;
  }

  @override
  Future<Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) {
    final response = super.patch(url, headers: headers, body: body, encoding: encoding);
    _logResponse(response);
    return response;
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) {
    final response = super.delete(url, headers: headers);
    _logResponse(response);
    return response;
  }

  @override
  Future<String> read(url, {Map<String, String> headers}) {
    final response = super.read(url, headers: headers);
    _logResponseString(response);
    return response;
  }

  void close() => delegate.close();

  void _logRequest(BaseRequest request) {
    print('Request (${request.method}) URL: ${request.url}\nHeaders: ${request.headers}');
    if (request is Request && request.body != null && request.body.length > 0) {
      print('Body: ${request.body}');
    }
  }

  void _logResponse(Future<Response> futureResponse) async {
    final response = await futureResponse;
    print('Response (${response.statusCode}): Headers: ${response.headers}');
    if (response.body != null && response.body.length > 0) {
      print('Body: ${ response.body}');
    }
  }

  void _logResponseString(Future<String> futureResponse) async {
    final response = await futureResponse;
    print('Response string: $response');
  }
}
