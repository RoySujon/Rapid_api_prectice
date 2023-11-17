import 'package:flutter/material.dart';
import 'package:rapid_api/get_translate_model.dart';
import 'package:rapid_api/translator_screen.dart';

class TranslatorScreen extends StatelessWidget {
  const TranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select language'),
      ),
      body: FutureBuilder(
        future: getTranslate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TranslateScreen(
                                  getTranslateModel: snapshot.data![index]),
                            )),
                        title: Text(snapshot.data![index].name.toString()),
                        subtitle: Text(snapshot.data![index].code.toString()),
                      ),
                    ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
