class ApiRoutes {
  static const String authWithPassWord =
      'http://52.79.115.43:8090/api/collections/users/auth-with-password';
  static const String signUpAuth =
      'http://52.79.115.43:8090/api/collections/users/records';
  static const getUserAuth =
      'http://52.79.115.43:8090/api/collections/users/records?sort=-created';
  static const callList =
      'http://52.79.115.43:8090/api/collections/secrets/records?sort=-created';
  static const uploadSecret =
      'http://52.79.115.43:8090/api/collections/secrets/records';
}
