class AppConfig {

  static String domainName = 'https:.....';
  static String imageBaseUrl = 'https:...';

  static String appName = "Wartungpilot";

  static bool isDemo = false;

  static String getExtension(String url) {
    var parts = url.split("/");
    return parts[parts.length - 1];
  }

}
