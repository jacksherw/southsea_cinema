import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('Home page displays title, movie cards and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Welcome to $appTitle'), findsOneWidget);

      expect(find.byType(MovieCard), findsNWidgets(2));
      expect(find.text('The Truman Show'), findsOneWidget);
      expect(find.text('Pacific Rim'), findsOneWidget);

      expect(find.text('BOOK NOW'), findsNWidgets(2));
    });
  });
}