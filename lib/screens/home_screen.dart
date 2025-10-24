import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Base dimensions for scaling (based on iPhone X design 375x812)
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Scale factors
    double scaleFactor = screenWidth / baseWidth;
    double heightScaleFactor = screenHeight / baseHeight;

    // 🔹 Define responsive breakpoints
    bool isSmallDevice = screenWidth < 360;
    bool isMediumDevice = screenWidth >= 360 && screenWidth < 600;
    bool isLargeDevice = screenWidth >= 600;

    // 🔹 Adjust scaling dynamically based on device size
    if (isSmallDevice) {
      scaleFactor *= 0.9;
      heightScaleFactor *= 0.9;
    } else if (isLargeDevice) {
      scaleFactor *= 1.1;
      heightScaleFactor *= 1.1;
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background color
              Container(color: const Color(0xFFAEAFF7)),

              // Title text
              Positioned(
                top: 50 * heightScaleFactor,
                left: 20,
                right: 20,
                child: Text(
                  "It's Ok Not To Be OKAY !!",
                  style: TextStyle(
                    fontFamily: 'Alegreya',
                    fontSize: isSmallDevice
                        ? 28
                        : isMediumDevice
                        ? 40
                        : 42,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Background Circle SVG
              Positioned(
                top: isSmallDevice ? 60 : 240 * heightScaleFactor,
                right: isSmallDevice ? 20 : 50 * scaleFactor,
                width: (isSmallDevice ? 320 : 370) * scaleFactor,
                height: (isSmallDevice ? 300 : 370) * heightScaleFactor,
                child: SvgPicture.asset(
                  'lib/assets/images/BG Circle.svg',
                  fit: BoxFit.contain,
                ),
              ),

              // Girl SVG
              Positioned(
                top: isSmallDevice ? 30 : 120 * heightScaleFactor,
                left:
                    (screenWidth - (isSmallDevice ? 260 : 300) * scaleFactor) /
                    2,
                width: (isSmallDevice ? 260 : 300) * scaleFactor,
                height: (isSmallDevice ? 600 : 750) * heightScaleFactor,
                child: SvgPicture.asset(
                  'lib/assets/images/Girl.svg',
                  fit: BoxFit.contain,
                ),
              ),

              // Button
              Positioned(
                bottom: isSmallDevice ? 20 : 50 * heightScaleFactor,
                left: (screenWidth - 293 * scaleFactor) / 2,
                width: 293 * scaleFactor,
                height: 70 * heightScaleFactor,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add your button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF371B34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12 * scaleFactor),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 12 * heightScaleFactor,
                    ),
                  ),
                  child: Text(
                    'Let Us Help You',
                    style: TextStyle(
                      fontSize: isSmallDevice
                          ? 18
                          : isMediumDevice
                          ? 22
                          : 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'AlegreyaSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
