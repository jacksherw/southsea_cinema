import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }

    return const [
      Movie(
        id: 'truman-show',
        title: 'The Truman Show',
        synopsis:
            'An insurance salesman begins to suspect that his whole life is actually some sort of reality TV show.',
        ageRating: 'PG',
        runtime: '103 mins',
        screeningTime: '19:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/trumanshow2.jpeg',
      ),
      Movie(
        id: 'pacific-rim',
        title: 'Pacific Rim',
        synopsis:
            'As a war between humankind and monstrous sea creatures wages on, a former pilot and a trainee are paired up to drive a seemingly obsolete special weapon in a desperate effort to save the world from the apocalypse.',
        ageRating: 'U',
        runtime: '133 mins',
        screeningTime: '17:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/pacific-rim.jpeg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}