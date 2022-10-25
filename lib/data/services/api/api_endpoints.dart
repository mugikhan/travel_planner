enum ApiEndpoints { login, articles, me, lms, focus, meta, files }

// const serverUrl = "http://192.168.86.34:8080";
const company = "fda87a3b-9ea6-4786-acab-7c9a451abb29";
// const serverUrl = "http://192.168.0.174:8080";

extension ApiEndpointExtension on ApiEndpoints {
  String get path {
    switch (this) {
      case ApiEndpoints.login:
        return "/auth/login";
      case ApiEndpoints.articles:
        return "/articles";
      case ApiEndpoints.me:
        return "/users/me";
      case ApiEndpoints.lms:
        return "/lms";
      case ApiEndpoints.focus:
        return "/auth/focus";
      case ApiEndpoints.meta:
        return "/lms/meta";
      case ApiEndpoints.files:
        return "files/uuid";
    }
  }
}
