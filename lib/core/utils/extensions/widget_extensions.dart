import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'context_extensions.dart';

extension WidgetExtensions on Widget {
  Widget refreshIndicator(
      BuildContext context, {
        required RefreshController controller,
        required void Function()? onRefresh,
      }) => SmartRefresher(
    controller: controller,
    enablePullDown: true,
    header: WaterDropHeader(
      waterDropColor: context.colors.primaryColor,
    ),
    onRefresh: onRefresh,
    physics: BouncingScrollPhysics(),
    child: this,
  );
}