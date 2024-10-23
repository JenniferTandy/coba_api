import 'package:flutter/material.dart';
import '../services/quote_service.dart';
import '../widgets/quote_info.dart';

/// Layar utama aplikasi yang menampilkan kutipan acak
class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final QuoteService _quoteService = QuoteService(); // Inisialisasi service API
  Map<String, dynamic>? _quoteData; // Menyimpan data kutipan
  bool _isLoading = true; // Menunjukkan status loading
  String? _errorMessage; // Menyimpan pesan error jika terjadi masalah

  @override
  void initState() {
    super.initState();
    _fetchRandomQuote(); // Memanggil kutipan saat pertama kali layar ditampilkan
  }

  /// Fungsi untuk memanggil API dan mendapatkan kutipan acak.
  /// Ini juga mengatur state aplikasi seperti loading dan error.
  Future<void> _fetchRandomQuote() async {
    try {
      final data = await _quoteService.fetchRandomQuote();
      setState(() {
        _quoteData = data; // Menyimpan hasil data kutipan
        _isLoading = false; // Menyelesaikan status loading
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString(); // Menyimpan pesan error
        _isLoading = false; // Menyelesaikan status loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote App'),
      ),
      body: Center(
        // Menampilkan status loading, error, atau kutipan sesuai kondisi saat ini
        child: _isLoading
            ? CircularProgressIndicator() // Loading spinner
            : _errorMessage != null
                ? Text('Error: $_errorMessage') // Menampilkan error
                : _quoteData != null
                    ? QuoteInfo(quoteData: _quoteData!) // Menampilkan kutipan
                    : Text('No data available'), // Jika tidak ada data
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLoading = true; // Mengatur loading saat tombol ditekan
          });
          _fetchRandomQuote(); // Memanggil kutipan acak baru
        },
        child: Icon(Icons.refresh), // Ikon refresh
      ),
    );
  }
}
