import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class AvatarOverlays extends StatefulWidget {
  final List<String> avatarUrls;
  final double? containerHeight;
  final Size? avatarSize;
  final Color? avatarBorderColor;
  final TextStyle? labelTextStyling;
  final String? label;
  final bool glassMorphic;
  final int maximumAvatars;

  const AvatarOverlays({
    super.key,
    required this.avatarUrls,
    this.avatarSize,
    this.avatarBorderColor,
    this.containerHeight,
    this.labelTextStyling,
    this.glassMorphic = false,
    this.label,
    this.maximumAvatars = 3,
  });

  @override
  State<AvatarOverlays> createState() => _AvatarOverlaysState();
}

class _AvatarOverlaysState extends State<AvatarOverlays> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.containerHeight ?? 50,
      child: Stack(
        children: [
          ...widget.avatarUrls
              .take(widget.maximumAvatars)
              .mapIndexed(
                (index, url) => Positioned(
                  left: index * 20,
                  top: 0,
                  bottom: 0,
                  child: UnconstrainedBox(
                    child: Container(
                      width: widget.avatarSize?.width ?? 40,
                      height: widget.avatarSize?.height ?? 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: widget.avatarBorderColor ?? Theme.of(context).scaffoldBackgroundColor,
                          width: 3,
                        ),
                      ),
                      child: UserAvatar(
                        imageUrl: url,
                        size: widget.avatarSize ?? Size(40, 40),
                      ),
                    ),
                  ),
                ),
              ),

          widget.label == null
              ? SizedBox.shrink()
              : Positioned(
                  left:
                      widget.avatarUrls.take(widget.maximumAvatars).length * 20,
                  top: 0,
                  bottom: 0,
                  child: UnconstrainedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: widget.avatarBorderColor ?? Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          widget.label!,
                          style: widget.labelTextStyling ?? Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
