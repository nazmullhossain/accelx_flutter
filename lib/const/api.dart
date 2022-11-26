class ApiEndPoints {
  static final String baseUrl = 'http://restapi.adequateshop.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  // final String registerEmail = 'https://awesome-chatting-app.herokuapp.com/api/user';
  final String loginEmail = 'authaccount/login';
}
