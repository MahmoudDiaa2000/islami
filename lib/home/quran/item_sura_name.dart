import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          SuraDetailsScreen.routeName,
          arguments: SuraDetailsArgs(name: name, index: index),
        );
      },
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color:
              provider.isDarkMode()
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
        ),
      ),
    );
  }
}
