import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_details_screen.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/app_config_provider.dart';

class ItemHadethNameName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethNameName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
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

// class Hadeth {
//   String title ;
//   List<String> content ;
//   Hadeth({required this.title , required this.content});
// }
