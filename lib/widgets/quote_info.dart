import 'package:flutter/material.dart';

/// Widget ini menampilkan kutipan di layar.
/// Data kutipan diberikan melalui parameter `quoteData`.
class QuoteInfo extends StatelessWidget {
  final Map<String, dynamic> quoteData;

  QuoteInfo({required this.quoteData});

  @override
  Widget build(BuildContext context) {
    // Mengambil teks kutipan dari data API
    final quote = quoteData['text']; // Data kutipan

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '"$quote"', // Menampilkan kutipan
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
