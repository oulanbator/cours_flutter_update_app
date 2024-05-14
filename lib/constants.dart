class Constants {
  static const String appVersion = "1.0.0";

  static const String baseUrl = "https://flutter-api.webturtle.fr";
  static const String uriParams = "$baseUrl/items/params";
  static const String uriAssets = "$baseUrl/assets";

  static Map<String, String> publicHeaders = {
    'Content-Type': 'application/json; charset=utf-8'
  };
}
