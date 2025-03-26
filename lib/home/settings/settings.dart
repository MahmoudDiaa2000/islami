import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/settings/language_bottom_sheet.dart';
import 'package:islami/home/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color:
                  provider.isDarkMode()
                      ? AppColors.yellowColor
                      : AppColors.blackColor,
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showLanuageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:
                    provider.isDarkMode()
                        ? AppColors.primaryDarktColor
                        : AppColors.primaryLightColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == ('en')
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color:
                          provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.blackColor,
                    ),
                  ),

                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color:
                        provider.isDarkMode()
                            ? AppColors.yellowColor
                            : AppColors.blackColor,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 25),

          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color:
                  provider.isDarkMode()
                      ? AppColors.yellowColor
                      : AppColors.blackColor,
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showthemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:
                    provider.isDarkMode()
                        ? AppColors.primaryDarktColor
                        : AppColors.primaryLightColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color:
                          provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.blackColor,
                    ),
                  ),

                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color:
                        provider.isDarkMode()
                            ? AppColors.yellowColor
                            : AppColors.blackColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanuageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showthemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
