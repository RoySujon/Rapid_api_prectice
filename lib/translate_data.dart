import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart';

class TranslattingData extends GetxController {
  RxString trans = ''.obs;

  Future transtalteData(String code, String text) async {
    final data = await post(
        Uri.parse('https://text-translator2.p.rapidapi.com/translate'),
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'X-RapidAPI-Key':
              'b89853f2ddmsh56496346c4612fbp11281cjsnf8e605d85c1e',
          'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
        },
        body: {
          'source_language': 'en',
          'target_language': code,
          'text': text
        });
    // final decode = utf8.decoder;
    // var encodeByte = jsonDecode(data.body.toString())['data']['translatedText'];
    print(jsonDecode(data.body.toString()).toString());
    trans.value = jsonDecode(data.body.toString())['data']['translatedText'];

    return jsonDecode(data.body.toString());
  }
}
