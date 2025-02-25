import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Uint8List> fetchImageBytes(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

class ImageFromBytes extends StatelessWidget {
  final String imageUrl;

  const ImageFromBytes({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: fetchImageBytes(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Image.asset(
              'assets/images/image_default.jpg'); // صورة افتراضية أثناء التحميل
        } else if (snapshot.hasError) {
          return Image.asset('assets/images/image_default.jpg',
              fit: BoxFit.fill); // صورة بديلة عند حدوث خطأ
        } else {
          return Image.memory(snapshot.data!, fit: BoxFit.cover);
        }
      },
    );
  }
}
