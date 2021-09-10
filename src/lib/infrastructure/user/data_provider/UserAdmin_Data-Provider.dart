import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mitane_frontend/domain/user/entity/UserModels.dart';
import 'package:mitane_frontend/infrastructure/auth/data_provider/auth_provider.dart';

class UserAdminDataProvider {
  static final String _baseUrl = "http://localhost:3000/users";

  final Dio dio;
  UserAdminDataProvider({required this.dio});

  Future<User> create(User user) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.post("http://localhost:3000/users/create",
          data: jsonEncode({
            "name": user.name,
            "phoneNo": user.phoneNo,
            "roles": user.roles,
            "password": user.password
          }));

      if (response.statusCode == 201) {
        print(User.fromJson(jsonDecode(response.data)));
        return User.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful creation");
      return User(id: "", name: "", phoneNo: 0, password: "", roles: "");
    } catch(e) {
      print(e);
      throw e;
    }
  }


  Future<List<User>> fetchAll() async {

    try {
      final response = await dio.get("http://localhost:3000/users");
      return (response.data as List)
        .map((u) => User.fromJson(u))
        .toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<User> update(String id, User user) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.put("http://localhost:3000/users/update/$id",
          data: jsonEncode({
            "id": id,
            "name": user.name,
            "phoneNo": user.phoneNo,
            "roles": user.roles,
            "password": user.password
          }));

      if (response.statusCode == 200) {
        print(User.fromJson(jsonDecode(response.data)));
        print("Successful updation");
        return User.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful updation");
      return User(id: "", name: "", phoneNo: 0, password: "", roles: "");
    } catch(e) {
      print(e);
      throw e;
    }
    // final response = await http.put(Uri.parse("$_baseUrl/$id"),
    //     headers: <String, String>{"Content-Type": "application/json"},
    //     body: jsonEncode({
    //       "id": id,
    //       "name": user.name,
    //       "phoneNo": user.phoneNo,
    //       "roles": user.roles,
    //       "password": user.password
    //     }));

    // if (response.statusCode == 200) {
    //   return User.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception("Could not update the user");
    // }
    // return user;
  }

  Future<void> delete(String id) async {
    // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
    final response = await dio.delete("http://localhost:3000/users/delete/$id");    
    // final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the user");
    }
    print("Successful deletion");
  }
}