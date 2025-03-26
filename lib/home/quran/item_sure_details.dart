import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class ItemSureDetails extends StatelessWidget {
  String content;

  int index;

  ItemSureDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      "$content(${index + 1})",
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color:
            provider.isDarkMode()
                ? AppColors.yellowColor
                : AppColors.blackColor,
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
