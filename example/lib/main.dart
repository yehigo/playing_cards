import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:playing_cards_lib/playing_cards_lib.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700)),
      home: CardHomeView()));
}

class CardHomeView extends StatefulWidget {
  const CardHomeView({Key? key}) : super(key: key);

  @override
  State<CardHomeView> createState() => _CardHomeViewState();
}

class _CardHomeViewState extends State<CardHomeView> {
  Suit suit = Suit.spades;
  CardValue value = CardValue.ace;

  // This style object overrides the styles for the suits, replacing the
  // image-based default implementation for the suit emblems with a text based
  // implementation.
  PlayingCardViewStyle myCardStyles = PlayingCardViewStyle(
    suitStyles: {
      Suit.spades: SuitStyle(
        builder: (context) => const FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            "♠",
            style: TextStyle(fontSize: 500),
          ),
        ),
        style: TextStyle(color: Colors.grey[800]),
      ),
      Suit.hearts: SuitStyle(
        builder: (context) => const FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            "♥",
            style: TextStyle(fontSize: 500, color: Colors.red),
          ),
        ),
        style: const TextStyle(color: Colors.red),
      ),
      Suit.diamonds: SuitStyle(
        builder: (context) => const FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            "♦",
            style: TextStyle(fontSize: 500, color: Colors.red),
          ),
        ),
        style: const TextStyle(color: Colors.red),
      ),
      Suit.clubs: SuitStyle(
        builder: (context) => const FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            "♣",
            style: TextStyle(fontSize: 500),
          ),
        ),
        style: TextStyle(color: Colors.grey[800]),
      ),
      Suit.joker: SuitStyle(builder: (context) => Container()),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlayingCardView(card: PlayingCard(suit, value), style: myCardStyles),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<Suit>(
                value: suit,
                items: Suit.values
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    suit = val!;
                  });
                },
              ),
              DropdownButton<CardValue>(
                value: value,
                items: CardValue.values
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    value = val!;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
