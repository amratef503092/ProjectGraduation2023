import 'package:graduation_project/view_model/database/local/cache_helper.dart';

const String accessToken = "accessToken";
const String name = "name";
const String userID = "userID";
const String token = "token";

 userName()
{
  return  CacheHelper.getDataString(key: name);
}
getUserID()
{
  return  CacheHelper.getDataString(key: userID);
}
getToken()
{
  return  CacheHelper.getDataString(key: token);
}
