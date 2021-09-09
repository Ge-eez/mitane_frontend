
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/suggestion/entity/suggestion_model.dart';

class SuggestionProvider {
  final Dio dio;
  SuggestionProvider({
    required this.dio,
  });

  Future<List<dynamic>> getSuggestionByPrice() async{

    try {
      final response = await dio.get('http://localhost:3000/suggestion/price');
    if(response.statusCode == 200){
      if(response.data['data'].length == 0) return [];
      final data = response.data['data'];
      final suggestions = data.map((suggestion)=>Suggestion.fromJson(suggestion)).toList();   
      return suggestions;

    }
    } catch (e) {
      print(e);
      return [];

    }
    return [];


  }

}