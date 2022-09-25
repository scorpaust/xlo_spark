import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_spark/repositories/parse_errors.dart';
import 'package:xlo_spark/repositories/table_keys.dart';

import '../models/user.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);

    parseUser.set<String>(keyUserPhone, user.phone);

    parseUser.set<int>(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error({ParseErrors.getDescription(response.error!.code)});
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: Type.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt)
    );
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error({ParseErrors.getDescription(response.error!.code)});
    }
  }

  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response = await parseUser.getCurrentUserFromServer(parseUser.sessionToken);

      if (response.success) {
        return mapParseToUser(response.result);
      }
      else {
        await parseUser.logout();
      }
    }
    return null;
  }
}