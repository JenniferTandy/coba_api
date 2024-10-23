import 'dart:convert';
import 'package:http/http.dart' as http;

/// Kelas ini bertanggung jawab untuk memanggil API
/// yang memberikan kutipan acak.
class QuoteService {
  final String apiUrl = 'https://www.jcquotes.com/api/quotes/random';

  /// Fungsi ini memanggil API dan mengembalikan hasil dalam bentuk Map.
  /// Jika respons berhasil (status 200), kita akan memproses data JSON.
  Future<Map<String, dynamic>> fetchRandomQuote() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load quote'); // Mengangkat error jika gagal
    }
  }
}
