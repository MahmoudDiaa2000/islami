import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/hadeth/item_hadeth_details.dart';
import 'package:islami/home/quran/item_sure_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
              'assets/images/bg.png',

              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
            : Image.asset(
              'assets/images/main_backgroun_light-1.png',

              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color:
                    provider.isDarkMode()
                        ? AppColors.yellowColor
                        : AppColors.blackColor,
              ),
            ),
          ),
          body:
              args.content.isEmpty
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    ),
                  )
                  : Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.05,
                    ),
                    decoration: BoxDecoration(
                      color:
                          provider.isDarkMode()
                              ? AppColors.primaryDarktColor
                              : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ItemHadethDetails(content: args.content[index]);
                      },

                      itemCount: args.content.length,
                    ),
                  ),
        ),
      ],
    );
  }
}
