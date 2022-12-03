class ApiEndpoints {
  static const login = "/auth/token";

  static String users({String? id}) {
    return "/users/${id ?? ""}";
  }
}
