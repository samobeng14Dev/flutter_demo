import 'package:flutter/material.dart';
import 'quotes.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quote,
    required this.onDelete, // Callback for delete action
  });

  final Quote quote;
  final VoidCallback onDelete; // Callback function type for delete

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              '- ${quote.author}', // Display the author
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              onPressed: onDelete, 
              icon: Icon(Icons.delete),
              label: Text('Delete'), 
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
