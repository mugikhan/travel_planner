class ApiEndpoints {
  static const login = "/auth/token";
  static const authCode = "/auth/code";

  static String users({String? id}) {
    return "/users/${id ?? ""}";
  }
}
