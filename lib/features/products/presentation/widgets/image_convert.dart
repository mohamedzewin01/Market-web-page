// import 'dart:html' as html;
// import 'dart:ui' as ui; // استيراد dart:ui
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
//
// class WebImageWidget extends StatelessWidget {
//   final String imageUrl;
//
//   const WebImageWidget({super.key, required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     if (!kIsWeb) {
//       return SizedBox.shrink(); // لا تحتاج للعرض على الأجهزة غير الويب
//     }
//
//     final String viewType = 'web-image-$imageUrl'; // استخدام imageUrl لجعل viewType فريدًا
//
//     // إنشاء عنصر الـ Image في الـ HTML
//     final html.Element imgElement = html.ImageElement()
//       ..src = imageUrl
//       ..style.width = '100%'
//       ..style.height = 'auto';
//
//     // ربط العنصر بالمشاهد
//     ui..registerViewFactory(
//       viewType,
//           (int viewId) => imgElement,
//     );
//
//     return HtmlElementView(viewType: viewType);
//   }
// }
