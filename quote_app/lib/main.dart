import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        text: "Be yourself; everyone else is already taken.",
        author: "Oscar Wilde"),
    Quote(
        text: "In the middle of difficulty lies opportunity.",
        author: "Albert Einstein"),
    Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"),
  ];

  void _deleteQuote(int index) {
    setState(() {
      quotes.removeAt(index); // Remove the quote from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return QuoteCard(
            quote: quotes[index],
            onDelete: () => _deleteQuote(index), 
          );
        },
      ),
    );
  }
}
