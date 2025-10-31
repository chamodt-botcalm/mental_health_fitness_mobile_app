import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main_navigation_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    // Base design dimensions (for scaling)
    const double baseWidth = 375;
    const double baseHeight = 812;

    double scaleFactor = screenWidth / baseWidth;
    double heightScaleFactor = screenHeight / baseHeight;

    final bool isLandscape = orientation == Orientation.landscape;

    // Tablet adjustments
    if (screenWidth > 600) {
      scaleFactor *= 1.2;
      heightScaleFactor *= 1.2;
    }

    // Apply special adjustments for landscape
    double textFontSize = 40 * scaleFactor;
    double girlTop = 201 * heightScaleFactor;
    double buttonWidth = 300 * scaleFactor;
    double buttonHeight = 70 * heightScaleFactor;
    double buttonFontSize = 20 * scaleFactor;

    if (isLandscape) {
      // When in landscape → make layout fit better
      textFontSize *= 0.5; // smaller text
      girlTop -= 0 * heightScaleFactor; // move girl SVG up
      buttonWidth *= 0.3; // narrower button
      buttonHeight *= 1.9; // taller button
      buttonFontSize *= 0.5;
    }

    final content = SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background color
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
                fontSize: textFontSize,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Background Circle
          Positioned(
            top: 250 * heightScaleFactor,
            left: 0,
            child: SvgPicture.asset(
              'lib/assets/images/BG Circle.svg',
              fit: BoxFit.contain,
            ),
          ),

          // Girl SVG (moved up in landscape)
          Positioned(
            top: girlTop,
            left: (screenWidth - (320 * scaleFactor)) / 2,
            width: 320 * scaleFactor,
            height: 640 * heightScaleFactor,
            child: SvgPicture.asset(
              'lib/assets/images/Girl.svg',
              fit: BoxFit.contain,
            ),
          ),

          // Button (adjusted size)
          Positioned(
            bottom: 50 * heightScaleFactor,
            left: (screenWidth - buttonWidth) / 2,
            width: buttonWidth,
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                      );
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
                  fontSize: buttonFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'AlegreyaSans',
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SizedBox(
        child: isLandscape
            ? SizedBox(
                child: SizedBox(height: screenHeight, child: content),
              )
            : content,
      ),
    );
  }
}
