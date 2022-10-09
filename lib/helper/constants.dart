import 'package:flutter/material.dart';

const basUrl = 'https://direction.hwzn.sa/';
const String imagesBaseUrl = 'https://direction.hwzn.sa/public/';
const String userAvatar = 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg';

const String loginPath = "api/login";
const String registerPath = "api/register";
const String sendCodePath = "api/send-code";
const String activateAccountPath = "api/send-code";
const String resetPassPath = "api/reset-password";
const String updateProfilePath = "api/update-profile";

const String homeDataPath = "api/home";
const String userInterestsPath = "api/user-intrests";
const String categoriesPath = "api/categories";
const String categoryProvidersPath = "api/providers-by-category/";
const String providerDetailsPath = "api/provider/";
const String onBoardingPath = "api/initial-pages";
const String sendOrderPath = "api/send-order";
const String userOrdersPath = "api/user-orders";
const String orderDetailsPath = "api/order-details/";
const String termsPath = "api/terms";
const String aboutPath = "api/about";
const String policyPath = "/api/policy";
const String contactUsPath = "/api/policy";
const String rateProviderPath = "api/rate-provider";

/// App IMAGES
const String appLogo = "assets/images/logo.png";

const kDefaultPadding = 16.0;
const kDefaultPadding_2 = 20.0;
const kDefaultBorderRadius = 16.0;

String reformatDate(DateTime? value) {
  if (value == null) return '';
  final reformatted = value.year.toString() +
      '-' +
      value.month.toString().padLeft(2, '0') +
      '-' +
      value.day.toString().padLeft(2, '0');
  return reformatted;
}

