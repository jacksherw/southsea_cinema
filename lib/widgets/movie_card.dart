import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  int _ticketAmount = 1;
  String _feedback = '';

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Card(
      color: cinemaSurface,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movie.imagePath,
                  width: 80,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(
                    width: 80,
                    height: 110,
                    child: ColoredBox(
                      color: cinemaBackground,
                      child: Icon(Icons.movie, color: cinemaFontMuted),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title, style: cinemaHeaderStyle),
                      const SizedBox(height: 4),
                      Text(
                        '${movie.runtime} · ${movie.ageRating}',
                        style: const TextStyle(color: cinemaFontMuted),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.synopsis,
                        style: const TextStyle(color: cinemaFontMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Screening time: ${movie.screeningTime}',
              style: const TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 8),
            Text(
              'Ticket price: £${movie.ticketPrice.toStringAsFixed(2)}',
              style: const TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select quantity (up to 5)',
              style: TextStyle(fontSize: 14, color: cinemaFontWhite),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                DropdownMenu<int>(
                  initialSelection: _ticketAmount,
                  width: 100,
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() => _ticketAmount = value);
                    }
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: '1'),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                    DropdownMenuEntry(value: 5, label: '5'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _feedback =
                          '$_ticketAmount ticket(s) added to order for ${movie.title}';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                    foregroundColor: cinemaFontWhite,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Add to order'),
                ),
              ],
            ),
            if (_feedback.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                _feedback,
                style: const TextStyle(color: cinemaFontWhite),
              ),
            ],
          ],
        ),
      ),
    );
  }
}