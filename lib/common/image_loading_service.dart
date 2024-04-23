import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoadingService extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const ImageLoadingService(
      {super.key, required this.imageUrl, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Container(),
          );
        },
      ),
    );
  }
}
