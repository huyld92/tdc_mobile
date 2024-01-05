import 'dart:convert';

import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/core/constants/app_url.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect {
  final headers = {'Content-Type': 'application/json; charset=utf-8'};

  Future<http.Response> loginWithPhone(String phone, String password) async {
    var url = Uri.parse(AppUrl.loginEndPoint);
    Map body = {"phone": phone, "password": password};

    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    // Lưu cookies từ response vào CookieJar
    CookieUtil.saveCookie(url, response.headers["set-cookie"]);

    return response;
  }

  Future<http.Response> logout() async {
    var url = Uri.parse(AppUrl.logoutEndPoint);

    headers["cookie"] = await CookieUtil.getCookie();
    http.Response response = await http.post(url, headers: headers);

    return response;
  }

  Future<http.Response> getTributeList() async {
    var url = Uri.parse(AppUrl.getTributeListEndPoint);

    headers["cookie"] = await CookieUtil.getCookie();

    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> getServiceList() async {
    var url = Uri.parse(AppUrl.getServiceListEndPoint);

    headers["cookie"] = await CookieUtil.getCookie();

    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> getTributeByID(int id) async {
    var url = Uri.parse(AppUrl.getTributeByIDEndPoint + id.toString());

    headers["cookie"] = await CookieUtil.getCookie();

    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> getServiceByID(int id) async {
    var url = Uri.parse(AppUrl.getServiceByIDEndPoint + id.toString());

    headers["cookie"] = await CookieUtil.getCookie();

    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> getProfileByID(int accountID) async {
    var url = Uri.parse(AppUrl.getProfileByIDEndPoint + accountID.toString());

    headers["cookie"] = await CookieUtil.getCookie();

    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  //wallet
  Future<http.Response> topUpAmount(int amount, String description) async {
    var url = Uri.parse(
        '${AppUrl.topUpAmountEndPoint}?amount=$amount&orderInfo=$description');

    headers["cookie"] = await CookieUtil.getCookie();
    http.Response response = await http.post(url, headers: headers);

    return response;
  }
}
