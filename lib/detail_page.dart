import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/Book.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  DetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.imageUrl),
            SizedBox(height: 16),
            Text('Title: ${book.productTitle}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Category: ${book.category}'),
            Text('Class: ${book.className}'),
            Text('Subject: ${book.subjectName}'),
            Text('MRP: ${book.bookMrp}'),
            Text('Price: ${book.bookPrice}'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _launchURL(book.productUrl);
              },
              child: Text('View Product'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
