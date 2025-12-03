import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/extensions/context_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? cacheKey;
  final String url;
  final BoxFit? fit;
  final bool makeRound;
  final BorderRadius? borderRadius;
  final bool addOverlay;
  final Size? size;
  final int cacheWidth;
  final int cacheHeight;

  const CustomNetworkImage({
    super.key,
    this.cacheKey,
    this.makeRound = false,
    this.borderRadius,
    this.fit,
    this.size,
    this.addOverlay = false,
    required this.url,
    this.cacheWidth = 1920,
    this.cacheHeight = 1080,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: makeRound
          ? BorderRadius.circular(((size?.width ?? 100) * 2))
          : (borderRadius ?? BorderRadius.zero),
      child: url.isEmpty
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: context.colors.backgroundColor),
              child: Opacity(
                opacity: 0.5,
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                  width: double.infinity,
                  height: double.infinity,
                  colorFilter: ColorFilter.mode(
                    context.colors.iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: url,
              cacheKey: cacheKey,
              // memCacheWidth: cacheWidth,
              // memCacheHeight: cacheHeight,
              width: size?.width ?? double.infinity,
              height: size?.height ?? double.infinity,
              fit: fit ?? BoxFit.cover,
              color: addOverlay ? Colors.black.withValues(alpha: 0.2) : null,
              colorBlendMode: addOverlay ? BlendMode.srcOver : null,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator()
              ),
              errorWidget: (context, url, error) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(color: context.colors.backgroundColor),
                  child: Opacity(
                    opacity: 0.5,
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      width: double.infinity,
                      height: double.infinity,
                      colorFilter: ColorFilter.mode(
                        context.colors.iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
