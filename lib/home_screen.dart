import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:islami/home/radio/radio_tab.dart';
import 'package:islami/home/sebha/sebha_tab.dart';
import 'package:islami/home/settings/settings.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode() ? Image.asset('assets/images/bg.png',

          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,) :

        Image.asset('assets/images/main_backgroun_light-1.png',

          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(

          appBar: AppBar(

            title: Text(AppLocalizations.of(context)!.app_title,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: provider.isDarkMode() ?
              AppColors.whiteColor :
              AppColors.blackColor,),

            ),
          ),

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Theme
                    .of(context)
                    .primaryColorLight
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },

                items: [
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                      'assets/images/moshaf_blue.png')),
                      label: AppLocalizations.of(context)!.quran)

                  , BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                      'assets/images/Path 1.png')),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                      'assets/images/radio_icon.png'
                  )), label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                      'assets/images/sebha_icon.png')),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.setting)
                ]),

          ),

          body: tab[selectedIndex],


        )
      ],
    );
  }

  List<Widget>tab = [
    QuranTab(), HadethTab(), RadioTab(), SebhaTab(), SettingsTab()
  ];
}
