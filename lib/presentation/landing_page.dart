import 'package:beep_user/core/responsive/responsive.dart';
import 'package:beep_user/core/utils/app_assets.dart';
import 'package:beep_user/core/utils/app_theme.dart';
import 'package:beep_user/core/utils/helper.dart';
import 'package:beep_user/core/utils/widgets/animated_sized_box.dart';
import 'package:beep_user/presentation/components/app_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: !Responsive.isMobile(context) ? 65 : 55,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: AnimatedPadding(
          duration: Helper().defaultDuration,
          padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? Get.width * .01 : Get.width * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.logoIcon, height: 33),
                  SizedBox(width: defaultPadding / 1.5),
                  Image.asset(AppAssets.beepTextLogo, height: 25),
                  SizedBox(width: defaultPadding / 1.5),
                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: !Responsive.isMobile(context)
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppBarButton(
                            title: "Welcome",
                            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                            onPressed: () {},
                          ),
                          SizedBox(width: Get.width * .005),
                          AppBarButton(
                            title: "Became an Operator",
                            onPressed: () {},
                          ),
                        ],
                      )
                    : Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(AppAssets.moreIcon, height: 20),
                      ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              SizedBox(
                height: Get.width / 4,
                width: Get.width,
                /* foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated,
                    // stops: const [0.0, 10.0],
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                  ),
                ), */
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //* Background Image
                    Image.asset(AppAssets.homeColorBg, fit: BoxFit.fitWidth),
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor.withAlpha(1),
                            Theme.of(context).scaffoldBackgroundColor,
                          ],
                        ),
                      ),
                      child: Image.asset(
                        AppAssets.homeTransparentBg,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPadding(
                duration: Helper().defaultDuration,
                padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? Get.width * .04 : Get.width * .06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Intro
                    AnimatedSizedBox(isMobileH: !Responsive.isDesktop(context) ? Get.width * 0.070 : Get.width * 0.040),
                    if (Responsive.isDesktop(context))
                      Row(
                        children: [
                          Expanded(
                            child: Padding(padding: EdgeInsets.only(top: Get.width * 0.040), child: downloadText(context)),
                          ),
                          AnimatedSizedBox(isMobileW: Get.width * .060),
                          Expanded(child: coinWithPhone(context)),
                        ],
                      )
                    else ...[
                      coinWithPhone(context),
                      downloadText(context),
                      // AnimatedSizedBox(isMobileH: Get.width * 0.070),
                    ],
                    AnimatedSizedBox(
                      isMobileH: Responsive.isMobile(context)
                          ? Get.width * .080
                          : Responsive.isTablet(context)
                              ? Get.width * .090
                              : Get.width * .020,
                    ),

                    ///* Download App
                    Container(
                      // color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: Responsive.isDesktop(context) ? MainAxisAlignment.start : MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.getGooglePlay,
                            height: Responsive.isMobile(context)
                                ? Get.width * .1
                                : Responsive.isTablet(context)
                                    ? Get.width * .090
                                    : Get.width * .045,
                          ),
                          SizedBox(width: !Responsive.isDesktop(context) ? defaultPadding : defaultPadding * 2),
                          Image.asset(
                            AppAssets.getAppleStore,
                            height: Responsive.isMobile(context)
                                ? Get.width * .1
                                : Responsive.isTablet(context)
                                    ? Get.width * .090
                                    : Get.width * .045,
                          ),
                        ],
                      ),
                    ),
                    AnimatedSizedBox(isMobileH: Responsive.isDesktop(context) ? Get.width * .1 : Get.width * .2),
                    //* Details
                    IntrinsicHeight(
                      child: OverflowBox(
                        maxWidth: Get.width,
                        child: Container(
                          // transform: Matrix4.translationValues(-20.0, 0, 0),
                          color: const Color(0xff09231A),
                          padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.8, horizontal: Get.width * 0.1),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (Responsive.isMobile(context))
                                  Column(
                                    children: [
                                      brandingAddress(context),
                                      AnimatedSizedBox(isMobileH: Get.width * 0.027),
                                      companyDetails(context),
                                      AnimatedSizedBox(isMobileH: Get.width * 0.027),
                                      followUS(context),
                                    ],
                                  ),
                                if (Responsive.isTablet(context))
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            brandingAddress(context),
                                            AnimatedSizedBox(isMobileH: Get.width * 0.027),
                                            followUS(context),
                                          ],
                                        ),
                                      ),
                                      Expanded(child: companyDetails(context)),
                                    ],
                                  ),
                                if (Responsive.isDesktop(context))
                                  Row(
                                    children: [
                                      Expanded(child: brandingAddress(context)),
                                      Expanded(child: Center(child: companyDetails(context))),
                                      Expanded(child: followUS(context)),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //* Intro
  AnimatedContainer coinWithPhone(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Helper().defaultDuration,
      height: Responsive.isMobile(context)
          ? Get.width * 0.6
          : Responsive.isTablet(context)
              ? 400
              : Get.width * 0.350,
      child: SvgPicture.asset(
        AppAssets.carWashImage,
        width: Get.width,
      ),
    );
  }

  Column downloadText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSizedBox(isMobileH: Get.width * 0.050),
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedDefaultTextStyle(
            duration: Helper().defaultDuration,
            style: TextStyle(
                fontSize: Responsive.isMobile(context)
                    ? 28
                    : Responsive.isTablet(context)
                        ? 30
                        : 41,
                fontWeight: FontWeight.w800,
                fontFamily: fontFamily),
            child: const Text(
              '“A better car wash”',
            ),
          ),
        ),
        AnimatedSizedBox(isMobileH: !Responsive.isDesktop(context) ? Get.width * 0.020 : Get.width * 0.035),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: "Find a beep.\nScan QR code to start.\nWash.\nRinse.\nDry.\nVacuum.\n",
            style: TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.w800,
              height: 1.5,
              fontSize: Responsive.isMobile(context)
                  ? 20
                  : Responsive.isTablet(context)
                      ? 22
                      : 25,
            ),
            children: [
              TextSpan(
                text: "Done.",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  height: 1.5,
                  fontSize: Responsive.isMobile(context)
                      ? 20
                      : Responsive.isTablet(context)
                          ? 22
                          : 25,
                ),
              ),
            ],
          ),
        ),
        // AnimatedSizedBox(isMobileH: !Responsive.isDesktop(context) ? Get.width * 0.050 : Get.width * 0.025),
      ],
    );
  }

  //* Details
  Column brandingAddress(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logAndAddress(context),
      ],
    );
  }

  Column logAndAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: Responsive.isDesktop(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.beepTextLogo, height: 35, color: Colors.white),
        AnimatedSizedBox(isMobileH: Responsive.isMobile(context) ? Get.width * .050 : Get.width * 0.010),
        //* Address
        Text(
          "525 W Van Buren St STE 1100, Chicago, IL 60607, United States",
          textAlign: Responsive.isDesktop(context) ? TextAlign.start : TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.width * 0.010),
          child: Text(
            "+1 988-344-7593",
            textAlign: Responsive.isDesktop(context) ? TextAlign.start : TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
          ),
        ),
        Text(
          "beep@email.com",
          textAlign: Responsive.isDesktop(context) ? TextAlign.start : TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
        ),
      ],
    );
  }

  Column companyDetails(context) {
    return Column(
      crossAxisAlignment: Responsive.isDesktop(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? Get.width * .020 : Get.width * 0.010),
          child: Text(
            "COMPANY".toUpperCase(),
            textAlign: Responsive.isDesktop(context) ? TextAlign.start : TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        detailText("Operator", context),
        detailText("Start My Business", context),
        detailText("How Beep Works", context),
        detailText("Partner With Us", context),
        detailText("Contact Us", context),
      ],
    );
  }

  Column followUS(BuildContext context) {
    return Column(
      children: [
        AnimatedPadding(
          duration: Helper().defaultDuration,
          padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? Get.width * .030 : Get.width * 0.010),
          child: Text(
            "FOLLOW US".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.instagramIcon),
            SizedBox(width: defaultPadding * 1.5),
            SvgPicture.asset(AppAssets.youtubeIcon),
          ],
        ),
      ],
    );
  }

  Padding detailText(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: !Responsive.isDesktop(context) ? Get.width * 0.015 : Get.width * .005),
      child: Text(
        text,
        textAlign: Responsive.isDesktop(context) ? TextAlign.start : TextAlign.center,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      ),
    );
  }
}
