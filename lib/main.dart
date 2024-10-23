import 'package:flutter/material.dart';
import 'screens/quote_screen.dart';

/// Entry point dari aplikasi. Di sini kita memanggil MaterialApp
/// dan menentukan layar utama aplikasi.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote App',
      home: QuoteScreen(), // Mengarahkan ke QuoteScreen sebagai layar utama
    );
  }
}
