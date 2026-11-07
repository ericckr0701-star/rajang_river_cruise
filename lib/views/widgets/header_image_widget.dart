import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({
    super.key,
    required this.imageAsset,
    this.expand = false,
  });

  final String imageAsset;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      width: double.infinity,
      height: expand ? double.infinity : 240,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.infinity,
          height: expand ? double.infinity : 240,
          color: Colors.teal.shade800,
          alignment: Alignment.center,
          child: const Icon(Icons.landscape, color: Colors.white, size: 72),
        );
      },
    );
  }
}
