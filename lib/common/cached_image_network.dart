import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double radiuse;
  const CachedImage({super.key, required this.imageUrl, this.radiuse = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiuse),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) {
          return Container(
            color: Colors.red,
          );
        },
        placeholder: (context, url) {
          return Container(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
