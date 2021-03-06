import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';

class MachineryDataProvider {
  final Dio dio;
  MachineryDataProvider({required this.dio});

  Future<Machinery> create(Machinery machinery) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.post("http://localhost:3000/machinery",
          data: jsonEncode({
            "name": machinery.name,
          }));

      if (response.statusCode == 201) {
        print(Machinery.fromJson(jsonDecode(response.data)));
        return Machinery.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful creation");
      return Machinery(id: "", name: "");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<Machinery>> fetchAll() async {
    try {
      // Couln't check token is a requirement here
      final response = await dio.get("http://localhost:3000/machinery");
      return (response.data as List).map((u) => Machinery.fromJson(u)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Machinery> update(String id, Machinery machinery) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.put("http://localhost:3000/machinery/$id",
          data: jsonEncode({
            "id": id,
            "name": machinery.name,
          }));

      if (response.statusCode == 200) {
        print(Machinery.fromJson(jsonDecode(response.data)));
        print("Successful updation");
        return Machinery.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful updation");
      return Machinery(id: "", name: "");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> delete(String id) async {
    // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
    final response = await dio.delete("http://localhost:3000/machinery/$id");
    // final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the user");
    }
    print("Successful deletion");
  }
}
