import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/extensions/context_extensions.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isAgentVerified;
  final bool showCrown;
  final BorderRadius? borderRadius;
  final Size? size;
  final Size? crownSize;
  final VoidCallback? onTap;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.isAgentVerified = false,
    this.size,
    this.showCrown = false,
    this.crownSize,
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

            Visibility(
              visible: showCrown,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: crownSize?.width ?? 30,
                  height: crownSize?.height ?? 30,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: context.colors.backgroundColor,
                  ),
                  child:
                      SvgPicture.asset(
                            "assets/images/icons/crown_outlined.svg",
                            width: double.infinity,
                            height: double.infinity,
                            colorFilter: ColorFilter.mode(
                              Color(0xFFFFC107),
                              BlendMode.srcIn,
                            ),
                          )
                          .animate(
                            autoPlay: true,
                            onComplete: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .shimmer(
                            duration: Duration(milliseconds: 2000),
                            colors: [
                              Color(0xFFF7C873),
                              // Golden Glow
                              Color(0xFFFFE9A7),
                              // Soft Champagne
                              Color(0xFFFFC107),
                              // Amber Pop
                              Color(0xFFFF9800),
                              // Deep Orange// CribLynk Accent (Orange Touch)
                            ],
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
