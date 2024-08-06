import 'package:dio/dio.dart';

String ksBaseUrl = "https://jollof.tatspace.com/api/v1";
String KsSignUp = "auth/sign-up";
String KsRequestToken = "auth/sign-up/otp/request";
String KsVerifyOTP = "auth/sign-up/otp/verify";
String KsPasswordRequestToken = "auth/otp/request";
String KsPasswordVerifyOTP = "auth/otp/verify";
String KsPasswordUpdate = "auth/password/update";
String KsUserprofile = "user/update";
String KsLogin = "auth/sign-in";
String KsretrieveUserProfile = "/user";
String ksWallet = "wallet";
String? ksTips = "tips/filter?sortBy=createdAt&orderBy=asc&page=1&limit=10";
String? ksLike = "tips/like/";
String? ksUnLike = "tips/unlike/";
String? ksSingle = "tips/";
String? ksPaymentInitialize = "payment/initialize";
String? ksPaymentInitializeVerify = "payment/verify/";
String? ksUserQuestioneer = "user/questionare/submit";
String? ksInitializeInvestment = "investment/initialize";
String? ksInvestmentList =
    "investment/filter?sortBy=createdAt&orderBy=desc&page=1&limit=10&isOptedOut=false";
String? ksBankList = "wallet/payout/banks";
String? ksPayoutAccounts = "wallet/payout/account/all";
String? ksAddPayoutAccount = "wallet/payout/account/add";
String? ksValidatePayoutAccount = "wallet/payout/account/validate";
String? ksInitializePayoutAccount = "wallet/payout/initialize";
String? ksWalletStatement = "wallet/statements";
String? ksExchangeRate = "exchange/rate";
String? ksWalletConversion = "wallet/conversion";
String? ksPaymentLinkCreate = "payment/link/create";
String? ksPaymentLinkRedeem = "payment/link/redeem";
String? ksPreferenceUpdate = "user/setting/preference/update";
String? ksPreferenceFetch = "user/setting/preference";
String? ksAvatarList = "avatar/filter";
String? ksReferralUpdate = "user/referal/update";
String  ksSubscription = "subscription/payment/process";
String  ksGetSubscription = "subscription";
class BaseApi {
  var dio = Dio();
  String baseUrl = ksBaseUrl;
  Options defaultOptions = Options(
    sendTimeout: Duration(seconds: 20), // 20 seconds
    receiveTimeout: Duration(seconds: 20), // 20 seconds
    validateStatus: (s) => s! < 500,
  );
}
