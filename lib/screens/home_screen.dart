import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Base dimensions (design reference, e.g., iPhone X)
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Scale factors
    final double scaleFactor = screenWidth / baseWidth;
    final double heightScaleFactor = screenHeight / baseHeight;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background
              Container(color: const Color(0xFFAEAFF7)),

              // Title
              Positioned(
                top: 60 * heightScaleFactor,
                left: 20 * scaleFactor,
                right: 20 * scaleFactor,
                child: Text(
                  "It's Ok Not To Be OKAY !!",
                  style: TextStyle(
                    fontFamily: 'Alegreya',
                    fontSize: 40 * scaleFactor,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Background Circle SVG
              Positioned(
                top: 250 * heightScaleFactor,
                right: 35 * scaleFactor,
                width: 392 * scaleFactor,
                height: 392 * heightScaleFactor,
                child: SvgPicture.asset(
                  'lib/assets/images/BG Circle.svg',
                  fit: BoxFit.contain,
                ),
              ),

              // Girl SVG
              Positioned(
                top: 201 * heightScaleFactor,
                left: (screenWidth - (320 * scaleFactor)) / 2,
                width: 320 * scaleFactor,
                height: 640 * heightScaleFactor,
                child: SvgPicture.asset(
                  'lib/assets/images/Girl.svg',
                  fit: BoxFit.contain,
                ),
              ),

              // Button
              Positioned(
                bottom: 50 * heightScaleFactor,
                left: (screenWidth - (300 * scaleFactor)) / 2,
                width: 300 * scaleFactor,
                height: 70 * heightScaleFactor,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF371B34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12 * scaleFactor),
                    ),
                  ),
                  child: Text(
                    'Let Us Help You',
                    style: TextStyle(
                      fontSize: 20 * scaleFactor,
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
