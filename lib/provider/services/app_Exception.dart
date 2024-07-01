class AppException implements Exception{
  final _message;
  final _prefix;
  
  
  AppException([this._message, this._prefix]);

  String toString(){
    return '$_message$_prefix';
  }
}

class FetchAppException extends AppException{
  FetchAppException([String? message]) : super(message, 'Error During Communication');

}

class BadReqException extends AppException{
  BadReqException([String? message]) : super(message, 'Invalid Request');

}

class UnauthorizedReqException extends AppException{
  UnauthorizedReqException([String? message]) : super(message, 'Unauthorize Request');

}

class NoInternetException extends AppException{
  NoInternetException([String? message]) : super(message, 'No Internet');

}