import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:onlinevoting/Model/Candidates.dart';
import 'package:onlinevoting/Model/Positions.dart';

class ApiServices {

  Future<List<Candidates>?> GetCandidateList() async {
    var client = http.Client();
    var uri = Uri.parse('http://raroacc1-001-site1.dtempurl.com/api/GetCandidateList');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return candidatesFromJson(json);
    }
  }

  Future<List<Positions>?> GetPositions() async {
    var client = http.Client();
    var uri = Uri.parse('http://raroacc1-001-site1.dtempurl.com/api/GetPositions');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return positionsFromJson(json);
    }
  }

}