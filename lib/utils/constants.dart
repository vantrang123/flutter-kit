class Constants {
  static bool testing = true;

  /// general setup
  static String appId = "space.acelords.starterkit";
  static String iosAppId = "space.acelords.starterkit";
  static String appName = "Flutter Starter Kit";
  static String appTagLine = "Buiild a FLutter app like a Pro by Using the BLoC Pattern!";
  static String appBio = "The Best Flutter Starter Kit";
  static String contactEmail = "support@acelords.space";
  static String logoKey = "assets/images/logo.png";
  static String appAbout = "Using this app will improve your project deliverability and sharpen your understanding of Flutter"
      "and BLoC pattern in no time. Build Flutter apps like a pro!";

  /// Share message
  static String shareLink = "http://bit.ly/acelords";
  static String shareMessage = "Check out this Amazing App at " + shareLink;
  static String shareSubject = "Best App Ever!";
  static String twitterUrl = "https://twitter.com/acelords";

  /// http headers
  static Object apiHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, String> backendHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer val'
  };

  /// FCM notification keys & topics
  static String publicTopicKey = testing ? "testing" : "public";

  /// e.t.c.
  static double commonPadding = 15.0;
  static String commonDateFormat = "dd MMM yyyy, hh:mm a";

  /// storage keys
  static String accessTokenKey = "token";
  static String userNameKey = "name";
  static String userFullNameKey = "full_name";
  static String userAkaKey = "aka";
  static String userEmailKey = "email";
  static String phoneNumberKey = "phone";
  static String appPreviouslyRunKey = "seen";
  static String userUuidKey = "user_uid";
  static String userAuthenticatedKey = "user_authenticated";
  static String fcmTokenKey = "fcm_token";
  static String vipCoinsKey = "vip_coins";
  static String vipCoinsDateKey = "vip_coins_date";

  /// api keys
  static String moviesApiKey = "d61431a2fb64b6e56c6f086952e63ab6"; // e.g. "bff708fnwFwef9832ed927da1d"; or Env.moviesApiKey;

  /// api routes
  static const String apiBaseUrlDev = "http://api.themoviedb.org/3/";
  static const String apiBaseUrlStaging = "http://api.themoviedb.org/3/";
  static const String apiBaseUrlPro = "http://api.themoviedb.org/3/";
  static String apiBaseUrl = "";
  static String moviesUrl = apiBaseUrl + "movie/popular?api_key=" + moviesApiKey;
  static String bannersUrl = apiBaseUrl + "movie/now_playing?api_key=" + moviesApiKey;


  /// route name
  static const String splash = '/splash';
  static const String home = "/home";
  static const String main = "/main";
  static const String referAFriend = "/referAFriend";
  static const String about = "/about";
  static const String rateApp = "/rateApp";
  static const String flutterTips = "/flutterTips";
  static const String login = "/login";
  static const String dashboard = "/dashboard";
  static const String moviesIndex = "/moviesIndex";

  static const fontName = "Muli";
}