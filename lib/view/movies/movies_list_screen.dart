import 'package:flutter/material.dart';
import 'package:rapid_api/model/movie_list.dart';
import 'package:rapid_api/view/movies/movie_details_screen.dart';
import 'package:rapid_api/view_model/controller/movie_controller.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  void initState() {
    // MovieController.fetchMoviList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder(
        future: MovieController.fetchMoviList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                              movieList: snapshot.data[index]),
                        ));
                  },
                  title: Text(snapshot.data[index].originalTitle.toString()),
                  leading: Hero(
                      tag: snapshot.data[index].id.toString(),
                      child: Image.network(
                          snapshot.data[index].posterPath.toString())),
                ),
              ),
              itemCount: snapshot.data.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
