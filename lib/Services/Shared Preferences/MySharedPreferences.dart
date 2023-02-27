import '../../Constants/shared_preferences_constants.dart';
import '../../Module/Login/Model/User.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static setUserData({required User user}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(userIdSPKey, user.userid ?? 0);
      value.setString(firstNameSPKey, user.firstName ?? '');
      value.setString(mobileNoSPKey, user.mobileno ?? '');
      value.setString(lastNameSPKey, user.lastName ?? '');
      value.setString(bearerTokenSPKey, user.bearerToken ?? '');
      value.setString(cnicSPKey, user.cnic ?? '');
      value.setString(addressSPKey, user.address ?? '');
      value.setString(roleNameSPKey, user.roleName ?? '');
      value.setString(fcmtokenSPKey, user.fcmtoken?? '');
      value.setString(imageSPKey, user.image ?? '');
      value.setInt(roleIdSPKey, user.roleId ?? 0);
      value.setInt(societyidSPKey, user.societyid ?? 0);
      value.setInt(superadminidSPKey, user.superadminid ?? 0);
    });
  }

  static Future<User> getUserData() async {

    User user = User();
    await SharedPreferences.getInstance().then((value) {
      value.getInt(userIdSPKey) ?? value.setInt(userIdSPKey, 0);
      value.getString(firstNameSPKey) ?? value.setString(firstNameSPKey, '');
      value.getString(lastNameSPKey) ?? value.setString(lastNameSPKey, '');
      value.getString(mobileNoSPKey) ?? value.setString(mobileNoSPKey, '');
      value.getString(bearerTokenSPKey) ??
          value.setString(bearerTokenSPKey, '');
      value.getString(cnicSPKey) ?? value.setString(cnicSPKey, '');
      value.getString(roleNameSPKey) ?? value.setString(roleNameSPKey, '');
      value.getString(imageSPKey) ?? value.setString(imageSPKey, '');
      value.getString(addressSPKey) ?? value.setString(addressSPKey, '');
      value.getInt(roleIdSPKey) ?? value.setInt(roleIdSPKey, 0);
      value.getInt(societyidSPKey) ?? value.setInt(societyidSPKey, 0);
      value.getInt(superadminidSPKey) ?? value.setInt(superadminidSPKey, 0);

      user = User(
          userid: value.getInt(userIdSPKey),
          firstName: value.getString(firstNameSPKey),
          lastName: value.getString(lastNameSPKey),
          bearerToken: value.getString(bearerTokenSPKey),
          cnic: value.getString(cnicSPKey),
          roleId: value.getInt(roleIdSPKey),
          roleName: value.getString(roleNameSPKey),
          image: value.getString(imageSPKey),
          address:value.getString(addressSPKey),
        mobileno: value.getString(mobileNoSPKey),
        societyid: value.getInt(societyidSPKey),
        superadminid: value.getInt(superadminidSPKey),

      );
    });

    return user;
  }


  static deleteUserData() async {
    User _user = User();

    await SharedPreferences.getInstance().then((value) {
      // value.remove(userIdSPKey);
      // value.remove(firstNameSPKey);
      // value.remove(lastNameSPKey);
  final success=    value.remove(bearerTokenSPKey);
  print(success.then((value) => value));
      // value.remove(cnicSPKey);
      // value.remove(roleNameSPKey);
      // value.remove(roleIdSPKey);

    });
  }


}
