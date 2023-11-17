import 'package:flutter/material.dart';
import 'package:rapid_api/model/movie_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieList});
  final MovieList movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        //2
        SliverAppBar(
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            centerTitle: false,
            title: Container(
              width: double.infinity,
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movieList.originalTitle.toString(),
                    textScaleFactor: 1),
              ),
            ),
            background: Hero(
              tag: movieList.id.toString(),
              child: Image.network(
                movieList.posterPath.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //3
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => TextButton(
                            onPressed: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child:
                                      Text(movieList.genres![index].toString()),
                                ))),
                        itemCount: movieList.genres!.length,
                      ),
                    ),
                    Text(movieList.overview.toString()),
                    Text('Release Date: ${movieList.releaseDate}')
                  ],
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    ));
  }
}
