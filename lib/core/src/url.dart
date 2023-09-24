import 'dart:io';

///This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class AppUrls {
  AppUrls._();

  static const String updateAndroidMobiMapUrl = 'https://mediamap.fpt.vn/mobimap/Android/MobiMap_v3.30.apk';
  static const String updateIOSMobiMapUrl = 'https://mediamap.fpt.vn/mobimap/IOS/MobiMapVN.plist';
}

class FileType {
  FileType._();

  static const String image = 'image';
  static const String imageJPGType = 'jpg';
  static const String imagePNGType = 'png';
  static const String fileAndroidType = 'apk';
  static const String fileIOSType = '.plist';
}

class ApiUrls {
  ApiUrls._();

  static const String baseUrl = 'https://mapapi-dev.fpt.vn/';

  static String getVersion = '/authorization/api/account/getVersion';
  static String checkImei = 'authorization/api/account/checkIMEI';
  static String getMenuByUser = '/authorization/api/account/getMenuByUser';
  static String login = '/authorization/api/account/login';
}

class IStorageUrls{
  IStorageUrls._();

  static const String apiKey = 'b4f7a8812aab757bb8fbe68044ed1d81';

  static const String baseUrl = 'http://istorage-stag.fpt.vn';

  static const String genToken = '/v2/api/public/getAccessToken';
  static const String upload = '/v2/upload';
  static const String bigUpload = '/v2/big-upload';
  static const String getFile = '/v2/api/file?id=';
}