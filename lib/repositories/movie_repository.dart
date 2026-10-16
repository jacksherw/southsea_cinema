import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
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
}