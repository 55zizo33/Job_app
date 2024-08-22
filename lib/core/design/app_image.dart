import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;
  final Color? color;

  const AppImage(
      this.path, {
        super.key,
        this.height,
        this.width,
        this.fit = BoxFit.scaleDown,
        this.color,
      });

  @override
  Widget build(BuildContext context) {
    // Handling local file paths
    if (path.contains("com.amit.jobs_app/cache")) {
      return Image.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
        color: color,
      );
    }
    // Handling SVG images
    else if (path.endsWith("svg")) {
      return SvgPicture.asset(
        "assets/svg/$path",
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    }
    // Handling network images
    else if (path.startsWith("http")) {
      return Image.network(
        path,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
        fit: fit,
        color: color,
      );
    }
    // Handling PNG and JPG images from assets
    else if (path.endsWith("png") || path.endsWith("jpg")) {
      return Image.asset(
        "assets/images/$path",
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
        fit: fit,
        color: color,
      );
    }

    // Return error widget if no valid path is provided
    return _errorWidget();
  }

  Widget _errorWidget() {
    return AppImage(
      "image_failed.png",
      height: height,
      width: width,
    );
  }
}
