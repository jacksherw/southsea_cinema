import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        synopsis: 'A test synopsis.',
        ageRating: 'PG',
        runtime: '100 mins',
        screeningTime: '19:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/test.jpeg',
      );

      expect(movie.id, 'test-movie');
      expect(movie.title, 'Test Movie');
      expect(movie.synopsis, 'A test synopsis.');
      expect(movie.ageRating, 'PG');
      expect(movie.runtime, '100 mins');
      expect(movie.screeningTime, '19:00');
      expect(movie.ticketPrice, 7.50);
      expect(movie.imagePath, 'assets/images/test.jpeg');
    });

    test('formattedPrice shows two decimal places for a whole-pound price', () {
      const movie = Movie(
        id: 'whole-pound',
        title: 'Whole Pound Movie',
        synopsis: 'Synopsis.',
        ageRating: 'U',
        runtime: '90 mins',
        screeningTime: '17:00',
        ticketPrice: 8,
        imagePath: 'assets/images/test.jpeg',
      );

      expect(movie.formattedPrice, '£8.00');
    });

    test('formattedPrice shows two decimal places for a price with pence', () {
      const movie = Movie(
        id: 'with-pence',
        title: 'Pence Movie',
        synopsis: 'Synopsis.',
        ageRating: 'U',
        runtime: '90 mins',
        screeningTime: '17:00',
        ticketPrice: 7.5,
        imagePath: 'assets/images/test.jpeg',
      );

      expect(movie.formattedPrice, '£7.50');
    });
  });
}