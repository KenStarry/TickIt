import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/extensions/context_extensions.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;
  final Size? size;
  final VoidCallback? onTap;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.size,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size?.width ?? 50.0,
        height: size?.height ?? 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Stack(
          children: [
            imageUrl.isEmpty
                ? Center(child: Icon(Icons.person_rounded))
                : ClipRRect(
                    borderRadius:
                        borderRadius ??
                        BorderRadius.circular((size?.width ?? 50) * 2),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.person_rounded),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
