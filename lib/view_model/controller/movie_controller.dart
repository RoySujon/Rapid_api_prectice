import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';
import 'package:rapid_api/model/movie_list.dart';

class MovieController extends GetxController {
  static Future fetchMoviList() async {
    final data = await get(
        Uri.parse('https://movies-api14.p.rapidapi.com/movies'),
        headers: {
          'X-RapidAPI-Key':
              'b89853f2ddmsh56496346c4612fbp11281cjsnf8e605d85c1e',
          'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
        });

    if (data.statusCode == 200) {
      var fetchData = jsonDecode(data.body.toString());

      final returnList =
          fetchData['movies'].map((e) => MovieList.fromJson(e)).toList();
      print(fetchData.toString());
      return returnList;
    }
  }
}
