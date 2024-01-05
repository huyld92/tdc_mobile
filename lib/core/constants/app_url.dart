class AppUrl {
  // static const String baseUrl = " ";
  static const String baseUrl = "http://10.0.2.2:8080/tdc";

// static const String baseUrl = "https://192.168.1.127:7179";

  static const String loginEndPoint = "$baseUrl/auth/login";
  static const String logoutEndPoint = "$baseUrl/auth/logout";

  //Service screen
  static const String getTributeListEndPoint = "$baseUrl/tribute/getList";
  static const String getServiceListEndPoint = "$baseUrl/service/getAllService";
  static const String getTributeByIDEndPoint = "$baseUrl/tribute/getTribute/";
  static const String getServiceByIDEndPoint = "$baseUrl/service/getService/";

  // profile Screen
  static const String getProfileByIDEndPoint = "$baseUrl/account/getProfile/";

  // wallet screen
  static const String topUpAmountEndPoint = "$baseUrl/order/topUp";

}
