import 'dart:convert';

import 'package:http/http.dart';

class GetTranslateModel {
  String? code;
  String? name;

  GetTranslateModel({this.code, this.name});

  GetTranslateModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

Future<List<dynamic>?> getTranslate() async {
  final data = await get(
      Uri.parse('https://text-translator2.p.rapidapi.com/getLanguages'),
      headers: {
        'X-RapidAPI-Key': 'b89853f2ddmsh56496346c4612fbp11281cjsnf8e605d85c1e',
        'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
      });
  if (data.statusCode == 200) {
    // print(jsonDecode(data.body).toString());
    final fetchData = jsonDecode(data.body.toString());
    List<dynamic> returnData = fetchData['data']['languages']
        .map((e) => GetTranslateModel.fromJson(e))
        .toList();
    // print(returnData[2].code.toString());
    return returnData;
    // return returnData;
  }
}
