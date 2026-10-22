import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketamount = 1;
  String _feedback = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movie.title,
              style: cinemaHeaderStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  widget.movie.runtime,
                  style: const TextStyle(color: cinemaFontMuted, fontSize: 16),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.movie.ageRating,
                  style: const TextStyle(color: cinemaFontMuted, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.movie.synopsis,
              style: const TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 16),
            Text(
              'Screening time: ${widget.movie.screeningTime}',
              style: const TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 8),
            Text(
              'Ticket price: £${widget.movie.ticketPrice.toStringAsFixed(2)}',
              style: const TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select quantities (up to 5 in total)',
              style: TextStyle(fontSize: 14, color: cinemaFontWhite),
            ),
            const SizedBox(height: 12),
            DropdownMenu<int>(
              initialSelection: _ticketamount,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() => _ticketamount = value);
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
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _feedback =
                      '$_ticketamount ticket(s) added to order for ${widget.movie.title}';
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
            const SizedBox(height: 12),
            Text(
              _feedback,
              style: const TextStyle(color: cinemaFontWhite),
            ),
          ],
        ),
      ),
    );
  }
}