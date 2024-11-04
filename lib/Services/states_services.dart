import 'dart:convert';

import 'package:covid/Models/world_stat_model.dart';
import 'package:covid/Services/Utilities/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  
  Future<WorldStatModel> fetchWorldStatesRecords () async {
    final response=await http.get(Uri.parse(ApiUrl.worldStateApi));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);

      return WorldStatModel.fromJson(data);

    }else{
      throw Exception("Error message");

    }
  }

  Future<List<dynamic>> countriesListApi () async {
    var data;
    final response=await http.get(Uri.parse(ApiUrl.countrisList));
    if(response.statusCode==200){
       data=jsonDecode(response.body);

      return data;

    }else{
      throw Exception("Error message");

    }
  }
}
