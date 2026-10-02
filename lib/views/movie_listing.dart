import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

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
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
              Text(
                "The Truman Show",
                style: cinemaHeaderStyle.copyWith(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    "103 mins",
                    style: TextStyle(color: cinemaFontMuted, fontSize: 14),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "PG",
                    style: TextStyle(color: cinemaFontMuted, fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text("An insurance salesman begins to suspect that his whole life is actually some sort of reality TV show."),
              const SizedBox(
                height: 40,
              ),
              Text(
                    "Southsea Cinema Room",
                    style: TextStyle( fontSize: 17),
                  ),
              const SizedBox(
                height: 12,
              ),
              Text(
                    "Friday 2nd Oct, 17:00 - ends at 18:43",
                    style: TextStyle( fontSize: 16),
                  ),
              const SizedBox(
                height: 30,
              ),
              Text(
                    "Select quantities (up to 5 in total)",
                    style: TextStyle( fontSize: 14),
                  ),
              const SizedBox(
                height: 12,
              ),
              DropdownMenu<int>(
                  initialSelection: _ticketamount,
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        _ticketamount = value;
                      });
                    }
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: "1"),
                    DropdownMenuEntry(value: 2, label: "2"),
                    DropdownMenuEntry(value: 3, label: "3"),
                    DropdownMenuEntry(value: 4, label: "4"),
                    DropdownMenuEntry(value: 5, label: "5")
                  ]),
                  const SizedBox(height: 12,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _feedback = "$_ticketamount ticket(s) added to order";
                  });
                },
                child: Text("Add to order"),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(_feedback),
            ])));
  }
}