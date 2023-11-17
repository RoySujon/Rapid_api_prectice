import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rapid_api/get_translate_model.dart';
import 'package:rapid_api/model_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> data = [];
  @override
  void initState() {
    getTranslate();
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: fetchData().asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Image.network(
                // color: Colors.red,
                filterQuality: FilterQuality.low,
                // isAntiAlias: true,
                // cacheHeight: ,
                // centerSlice: Rect.,
                // colorBlendMode: BlendMode.darken,
                snapshot.data![index].food!.image == null
                    ? 'https://media.istockphoto.com/id/1210768445/photo/skyscraper-in-dhaka-metropolitan-area.jpg?s=612x612&w=0&k=20&c=qGFV2qpVXkUNtm8KYT2avrSZwcBcoeM9wIp4LdADgrI='
                    : snapshot.data![index].food!.image.toString(),

                fit: BoxFit.cover,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10, crossAxisCount: 3,
              // childAspectRatio: .80,
              /* maxCrossAxisExtent: MediaQuery.of(context).size.width / 2 */
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

Future fetchData() async {
  final data = await get(
      Uri.parse(
          'https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser?nutrition-type=cooking&category%5B0%5D=generic-foods&health%5B0%5D=alcohol-free'),
      headers: {
        'X-RapidAPI-Key': 'b89853f2ddmsh56496346c4612fbp11281cjsnf8e605d85c1e',
        'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com'
      });
  if (data.statusCode == 200) {
    if (kDebugMode) {
      Map<String, dynamic> fetchData = jsonDecode(data.body);
      // print(jsonDecode(data.body).toString());

      List<dynamic> returnData =
          fetchData['hints'].map((e) => ModelData.fromJson(e)).toList();

      return returnData;
    }
  }
}
