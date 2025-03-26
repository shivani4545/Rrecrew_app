// import 'package:employee/models/login_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefService {
//   static const String keyAccessToken = "access_token";
//   static const String keyUserID = "user_id";
//   static const String keyAuthToken = "auth_token"; // Add a key for the auth token
//   static const String keyIsLoggedIn = "is_logged_in";
//
//   // Singleton Instance
//   static SharedPrefService? _instance;
//
//   // Private Constructor (to prevent direct instantiation)
//   SharedPrefService._();
//
//   // Get Instance Method (Singleton)
//   static Future<SharedPrefService> getInstance() async {
//     _instance ??= SharedPrefService._();
//     return _instance!; // Non-nullable assertion because we know it's initialized
//   }
//
//   // Save User Data
//   Future<void> saveUserData({required String userId, required String accessToken}) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(keyAccessToken, accessToken);
//     await prefs.setString(keyUserID, userId);
//     await prefs.setBool(keyIsLoggedIn, true);
//   }
//
//   // Save Auth Token
//   Future<void> saveAuthToken(String authToken) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(keyAuthToken, authToken);
//   }
//
//   // Get Access Token
//   Future<String?> getAccessToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(keyAccessToken);
//   }
//
//   // Get Auth Token
//   Future<String?> getAuthToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(keyAuthToken);
//   }
//
//   // Get User ID
//   Future<String?> getUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(keyUserID);
//   }
//
//   // Check if User is Logged In
//   Future<bool> isLoggedIn() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(keyIsLoggedIn) ?? false;
//   }
//
//   // Clear User Data (Logout)
//   Future<void> clearUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(keyAccessToken);
//     await prefs.remove(keyUserID);
//     await prefs.remove(keyAuthToken); // Remove auth token on logout
//     await prefs.remove(keyIsLoggedIn);
//   }
// }