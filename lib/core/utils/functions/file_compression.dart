import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

Future<File?> convertUint8ListToFile(Uint8List? imageBytes, {String? path}) async {

  if (imageBytes == null) {
    return null;
  }

  // Get temp directory
  final directory = await getTemporaryDirectory();
  final filePath =
      '${directory.path}${path ?? '/ticket_${DateTime.now().millisecondsSinceEpoch}.png'}';

  // Save as file
  final file = File(filePath);
  await file.writeAsBytes(imageBytes);

  return file;
}

Future<Uint8List> fetchImage(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

Uint8List blurImageBytes(Uint8List imageBytes, {int radius = 20}) {
  // 1. Decode the bytes into an editable image object
  final image = img.decodeImage(imageBytes);

  if (image == null) return imageBytes; // Safety check

  // 2. Apply Gaussian Blur
  final blurred = img.gaussianBlur(image, radius: radius);

  // 3. Encode back to PNG bytes for the PDF package
  return Uint8List.fromList(img.encodePng(blurred));
}