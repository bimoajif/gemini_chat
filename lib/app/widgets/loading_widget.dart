import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget get buildLoading => Container(
      constraints: const BoxConstraints(maxHeight: 72, maxWidth: 72),
      decoration: BoxDecoration(
          color: CupertinoColors.black.withOpacity(0.87),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: SvgPicture.asset(
          'images/bg_asset_star.svg',
          width: 32,
        ).animate(onPlay: (controller) {
          controller.repeat();
        }).rotate(
          duration: Durations.extralong4,
          delay: Durations.long4,
          curve: Curves.easeInOut,
        ),
        // child:
        //     CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
      ),
    ).animate(delay: Durations.medium1);
