import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageProxy {
  static const String _proxyBaseUrl = 'http://localhost:3000/proxy'; // Replace with your proxy server URL

  static String getProxiedImageUrl(String originalUrl) {
 
    return '$_proxyBaseUrl?url=${Uri.encodeComponent(originalUrl)}';
  }

  static ImageProvider getNetworkImage(String originalUrl) {
    final proxiedUrl = getProxiedImageUrl(originalUrl);
    return NetworkImage(proxiedUrl);
  }
  static Image buildImage(String originalUrl, {Key? key, double? width, double? height, BoxFit? fit}) {
    final proxiedUrl = getProxiedImageUrl(originalUrl);
    return Image.network(
      proxiedUrl,
      key: key,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}