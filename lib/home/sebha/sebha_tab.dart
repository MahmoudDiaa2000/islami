import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tesbehCount = 0;
  int index = 0;
  double angle = 0;
  List<String>tasbeh = [
    'سبحان الله ',
    'الحمد الله ',
    'لا اله الا الله  ',
    'الله اكبر  ',
    'لا حول ولا قوة الا بالله ',

  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [

        Stack(
          alignment: Alignment.center,
          children: [ Padding(
            padding: EdgeInsets.only(left: MediaQuery
                .of(context)
                .size
                .height * .06,
                bottom: MediaQuery
                    .of(context)
                    .size
                    .height * .32),
              child: provider.isDarkMode() ?
              Image.asset('assets/images/dark_head_of_seb7a.png',)
                  : Image.asset('assets/images/head_of_seb7a.png',


              )),
            GestureDetector(
              onTap: () {
                angle += 3;
                tesbehCount++;
                if (tesbehCount % 33 == 0) {
                  index++;
                }
                if (index == tasbeh.length) {
                  index = 0;
                }

                setState(() {

                });
              },
              child: Padding(
                padding: EdgeInsets.all(

                    MediaQuery
                        .of(context)
                        .size
                        .height * .1
                ),
                child: Transform.rotate(angle: angle,
                    child: provider.isDarkMode() ?
                    Image.asset('assets/images/dark_body_of_seb7a.png',) :
                    Image.asset('assets/images/body_of_seb7a.png',)),
              ),
            ),
          ],
        ),
        Text(AppLocalizations.of(context)!.number_of_tasbihat,
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .copyWith(
              color: provider.isDarkMode() ? AppColors.whiteColor : AppColors
                  .blackColor
          ),),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: provider.isDarkMode() ?
              AppColors.primaryDarktColor :
              AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text('$tesbehCount',
            style: TextStyle(fontWeight: FontWeight.w400,
              fontSize: 25,
              color: provider.isDarkMode() ?
              AppColors.whiteColor :
              AppColors.blackColor,),),),
        Container(
          margin: EdgeInsets.all(10),

          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          decoration: BoxDecoration(
              color: provider.isDarkMode() ?
              AppColors.yellowColor :
              AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(tasbeh[index],
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: 25,
              color: provider.isDarkMode() ?
              AppColors.blackColor :
              AppColors.whiteColor,),),)


      ],
    );
  }
}
