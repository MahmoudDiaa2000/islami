import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/quran/item_sure_details.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);

    if (verses.isEmpty) loadFile(args.index);
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
              args.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color:
                    provider.isDarkMode()
                        ? AppColors.yellowColor
                        : AppColors.blackColor,
              ),
            ),
          ),
          body:
              verses.isEmpty
                  ? Center(
                    child: CircularProgressIndicator(
                      color:
                          provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.primaryLightColor,
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

                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ItemSureDetails(
                          content: verses[index],
                          index: index,
                        );
                      },

                      itemCount: verses.length,
                      separatorBuilder:
                          (context, index) => Divider(
                            color:
                                provider.isDarkMode()
                                    ? AppColors.yellowColor
                                    : AppColors.primaryDarktColor,
                          ),
                    ),
                  ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }

    verses = lines;
    setState(() {});
  }
}

/// data class
class SuraDetailsArgs {
  String name;

  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
