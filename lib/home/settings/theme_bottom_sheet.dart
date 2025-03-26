import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import '../../providers/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      color:
          provider.isDarkMode()
              ? AppColors.primaryDarktColor
              : AppColors.whiteColor,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child:
                provider.isDarkMode()
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                    : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.dark,
                    ),
          ),

          SizedBox(height: 20),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child:
                provider.isDarkMode()
                    ? getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.light,
                    )
                    : getSelectedItemWidget(
                      AppLocalizations.of(context)!.light,
                    ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: AppColors.primaryLightColor),
        ),

        Icon(Icons.check, color: AppColors.primaryLightColor, size: 35),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.bodySmall!.copyWith(color: AppColors.primaryLightColor),
    );
  }
}
