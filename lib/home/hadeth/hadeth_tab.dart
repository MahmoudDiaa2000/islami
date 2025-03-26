import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/app_config_provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    loadHadethFile();
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/ahadeth_image.png'),
        ),
        Divider(
          color:
              provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
          thickness: 3,
        ),

        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                provider.isDarkMode()
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
          ),
        ),
        Divider(
          color:
              provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
          thickness: 3,
        ),

        Expanded(
          flex: 2,
          child:
              ahadethList.isEmpty
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    ),
                  )
                  : ListView.separated(
                    itemBuilder: (context, index) {
                      return ItemHadethNameName(hadeth: ahadethList[index]);
                    },
                    itemCount: ahadethList.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color:
                            provider.isDarkMode()
                                ? AppColors.yellowColor
                                : AppColors.primaryLightColor,
                        thickness: 3,
                      );
                    },
                  ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent = await rootBundle.loadString(
      'assets/files/ahadeth.txt',
    );
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
