class ApiEndPoints {
  static final String baseUrl = "http://restapi/adequateshop.com/api/";
  static _AuthEndPoints authEndPoint = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}
