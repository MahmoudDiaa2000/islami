import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/app_config_provider.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;

  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      content,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color:
            provider.isDarkMode()
                ? AppColors.yellowColor
                : AppColors.blackColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
