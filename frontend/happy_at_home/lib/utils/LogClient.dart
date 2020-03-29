import 'package:http/http.dart';

class LogClient extends BaseClient {
  LogClient(this.delegate);

  final Client delegate;

  Future<StreamedResponse> send(BaseRequest request) {
    _logRequest(request);
    return delegate.send(request);
  }

  void close() => delegate.close();

  void _logRequest(BaseRequest request) {
    print('Request (${request.method}) URL: ${request.url}\nHeaders: ${request.headers}');
    if (request is Request && request.body!= null) {
      print('Body: ${request.body}');
    }
  }
}
