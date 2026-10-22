import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';

Movie createMovie({double price = 7.50}) {
  return Movie(
    id: 'test-movie',
    title: 'Test Movie',
    synopsis: 'A test synopsis.',
    ageRating: 'PG',
    runtime: '100 mins',
    screeningTime: '19:00',
    ticketPrice: price,
    imagePath: 'assets/images/test.jpeg',
  );
}

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Welcome to $appTitle'), findsOneWidget);
  });

  group('formattedPrice', () {
    test('formats price with pound sign and two decimal places', () {
      expect(createMovie(price: 9.99).formattedPrice, '£9.99');
    });

    test('pads whole number prices with two zeros', () {
      expect(createMovie(price: 8).formattedPrice, '£8.00');
    });

    test('pads prices with one decimal place', () {
      expect(createMovie(price: 7.5).formattedPrice, '£7.50');
    });

    test('rounds prices with more than two decimal places', () {
      expect(createMovie(price: 6.499).formattedPrice, '£6.50');
    });

    test('formats a zero price', () {
      expect(createMovie(price: 0).formattedPrice, '£0.00');
    });
  });
}