import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

class PdfFonts {
  static Future<pw.Font> get urbanistRegular async {
    final data = await rootBundle.load('assets/fonts/Urbanist-Regular.ttf');
    return pw.Font.ttf(data);
  }

  static Future<pw.Font> get urbanistBold async {
    final data = await rootBundle.load('assets/fonts/Urbanist-Bold.ttf');
    return pw.Font.ttf(data);
  }

  static Future<pw.Font> get urbanistItalic async {
    final data = await rootBundle.load('assets/fonts/Urbanist-Italic.ttf');
    return pw.Font.ttf(data);
  }
}