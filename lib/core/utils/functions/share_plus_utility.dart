import 'dart:io';

import 'package:share_plus/share_plus.dart';

Future<void> shareImageFile(File file, {String? subject, String? text}) async {
  try {
    final params = ShareParams(
      subject: subject,
      text: text,
      files: [XFile(file.path)],
    );

    final result = await SharePlus.instance.share(params);

    if (result.status == ShareResultStatus.success) {}
  } catch (e) {
    // Handle any errors that may occur during sharing
    print('Error sharing file: $e');
  }
}