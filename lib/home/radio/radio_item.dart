import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:islami/home/radio/radio_model.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/app_config_provider.dart';

class RadioItem extends StatelessWidget {
  final Radio radio;
  final AudioPlayer audioPlayer;

  const RadioItem({super.key, required this.radio, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Text(
            radio.name ?? '',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  provider.isDarkMode()
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  await audioPlayer.play(UrlSource(radio.url!));
                },
                icon: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color:
                      provider.isDarkMode()
                          ? AppColors.yellowColor
                          : AppColors.primaryLightColor,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await audioPlayer.stop();
                },
                icon: Icon(
                  Icons.stop,
                  size: 50,
                  color:
                      provider.isDarkMode()
                          ? AppColors.yellowColor
                          : AppColors.primaryLightColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
