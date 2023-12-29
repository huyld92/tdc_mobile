import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:tdc_mobile/core/constants/app_url.dart';

class CookieUtil {
  static CookieJar cookieJar = CookieJar();

  static List<Cookie> parseCookies(String cookieString) {
    List<Cookie> cookies = [];

    List<String> cookieParts = cookieString.split('tdc-jwt=');

    String prefix = 'tdc-jwt=';
    int startIndex = cookieString.indexOf(prefix);
    if (startIndex != -1) {
      startIndex += prefix.length;
      int endIndex = cookieString.indexOf(';', startIndex);
      endIndex = endIndex != -1 ? endIndex : cookieString.length;
      List<String> str =
          cookieString.substring(startIndex, endIndex).trim().split("=");
      cookies.add(Cookie("tdc-jwt", str[0]));
    }
    prefix = 'tdc-jwt-refresh=';
    startIndex = cookieString.indexOf(prefix);
    if (startIndex != -1) {
      startIndex += prefix.length;
      int endIndex = cookieString.indexOf(';', startIndex);
      endIndex = endIndex != -1 ? endIndex : cookieString.length;
      List<String> str =
          cookieString.substring(startIndex, endIndex).trim().split("=");

      cookies.add(Cookie("tdc-jwt-refresh", str[0]));
    }
    return cookies;
  }

  static Future<void> saveCookie(Uri url, String? header) async {
    var cookies = CookieUtil.parseCookies(header!);

    cookieJar.saveFromResponse(url, cookies);
  }

  static Future<String> getCookie() async {
    String str = "";
    var url = Uri.parse(AppUrl.loginEndPoint);

    List<Cookie> cookies = await cookieJar.loadForRequest(url);

    for (Cookie cookie in cookies) {
      str += cookie.toString() + ", ";
    }
    return str;
  }
}
