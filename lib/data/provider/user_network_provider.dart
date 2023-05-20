import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tamyrlan/data/db/box_helper.dart';
import 'package:tamyrlan/domain/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:format/format.dart';

class UserNetworkProvider {
  final Dio _dio;

  const UserNetworkProvider(this._dio);

  Future<User> getUserProfile() async {
    var response = await _dio.get('/users/get_user/', queryParameters: {
      // "position_id": BoxHelper.getPositionId(),
      // "lang": BoxHelper.getLang(),
    });
    return _parseUser(response.data);
  }

  Future<void> editUser(User user) async {
    MultipartFile? g;
    if (user.avatar != null && user.avatar != "") {
      g = await MultipartFile.fromFile(user.avatar!);
    }
    //var splitDate = user.birthdayDate?.split('.');
    // var formattedDate = (splitDate?.length == 3)
    //     ? "${splitDate?[2]}-${splitDate?[1]}-${splitDate?[0]}"
    //     : null;
    var formData = FormData.fromMap({
      'full_name': user.fullName != "" ? user.fullName : null,
      //'birthday_date': formattedDate,
      'email': user.email != "" ? user.email : null,
      //'additional_info': user.description != "" ? user.description : null,
      'avatar': g,
      //'languages': jsonEncode(user.languages!.map((e) => e.toJson()).toList()),
    });
    debugPrint(formData.fields.toString());
    await _dio.put('/users/edit_user/', data: formData);
  }

  User _parseUser(dynamic e) {
    String? formattedDate;
    if (e['birthday_date'] != null) {
      var datetime = DateTime.parse(e['birthday_date']);
      formattedDate = format(
        "{:02d}.{:02d}.{:02d}",
        datetime.day,
        datetime.month,
        datetime.year,
      );
    }
    return User(
      fullName: e['full_name'],
      email: e['email'],
      phone: e['phone'],
      id: e['id'],
      avatar: e['avatar'],
      // birthdayDate: formattedDate,
      // languages:
      // (e['languages'] as List).map((e) => _parseUserLanguage(e)).toList(),
    );
  }
}
