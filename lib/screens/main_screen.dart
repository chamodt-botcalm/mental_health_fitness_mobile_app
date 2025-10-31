import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:hugeicons/styles/stroke_rounded.dart';
import 'package:ionicons/ionicons.dart';
import 'package:remix_ic/remix_ic.dart';
import 'package:simple_icons/simple_icons.dart';
import '../components/feeling.dart';
import '../components/task_card.dart';
import 'main_navigation_screen.dart';

class MainScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const MainScreen({super.key, this.scaffoldKey});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    final isTablet = screenWidth > 600;

    double bottomNavigationHeight = 85;

    // Base dimensions (design reference)
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Scale factors - keep images at original sizes
    double scaleFactor = isTablet
        ? 1.0
        : (screenWidth / baseWidth).clamp(0.8, 1.2);
    double heightScaleFactor = isTablet
        ? 1.0
        : (screenHeight / baseHeight).clamp(0.8, 1.2);

    // Adjust text scaling for landscape
    double textScale = isLandscape ? 0.9 : 1.0;

    if (isLandscape) {
      bottomNavigationHeight =
          80 * ((screenHeight / baseHeight).clamp(0.8, 1.2));
    }

    Widget content = _buildContent(
      scaleFactor,
      heightScaleFactor,
      textScale,
      screenWidth,
      isLandscape,
    );

    return SafeArea(
      child: isLandscape
          ? Column(
              children: [
                _buildHeader(scaleFactor, heightScaleFactor),
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildContent(
                      scaleFactor,
                      heightScaleFactor,
                      textScale,
                      screenWidth,
                      isLandscape,
                      includeHeader: false,
                    ),
                  ),
                ),
              ],
            )
          : content,
    );
  }

  Widget _buildHeader(double scaleFactor, double heightScaleFactor) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15 * scaleFactor,
        vertical: 10 * heightScaleFactor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'lib/assets/images/Hamburger.svg',
              width: 22,
              height: 18,
              placeholderBuilder: (BuildContext context) => Icon(Icons.menu),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          IconButton(
            icon: Image.asset(
              'lib/assets/images/Profile.png',
              width: 35,
              height: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    double scaleFactor,
    double heightScaleFactor,
    double textScale,
    double screenWidth,
    bool isLandscape, {
    bool includeHeader = true,
  }) {
    List<Widget> children = [];

    if (includeHeader) {
      children.add(
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15 * scaleFactor,
            vertical: 30 * heightScaleFactor,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/images/Hamburger.svg',
                  width: 22,
                  height: 18,
                  placeholderBuilder: (BuildContext context) =>
                      Icon(Icons.menu),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              IconButton(
                icon: Image.asset(
                  'lib/assets/images/Profile.png',
                  width: 35,
                  height: 35,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    }

    children.add(
      isLandscape
          ? Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 25 * scaleFactor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontSize: 30 * textScale,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Welcome back, ',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'Sarina!',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30 * heightScaleFactor),
                  Text(
                    'How are you feeling today ?',
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontSize: 22 * textScale,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20 * heightScaleFactor),
                  Feeling(),
                  SizedBox(height: 40 * heightScaleFactor),
                  Text(
                    "Today's Task",
                    style: TextStyle(
                      fontSize: 22 * textScale,
                      fontFamily: 'AlegreyaSans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20 * heightScaleFactor),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: TaskCards(),
                  ),
                  SizedBox(height: 20 * heightScaleFactor),
                            

                ],
              ),
            )
          : Expanded(
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 25 * scaleFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Alegreya',
                          fontSize: 30 * textScale,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Welcome back, ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Sarina!',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30 * heightScaleFactor),
                    Text(
                      'How are you feeling today ?',
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontSize: 22 * textScale,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20 * heightScaleFactor),
                    Feeling(),
                    SizedBox(height: 15 * heightScaleFactor),
                    Text(
                      "Today's Task",
                      style: TextStyle(
                        fontSize: 22 * textScale,
                        fontFamily: 'AlegreyaSans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20 * heightScaleFactor),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TaskCards(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );

    return Column(
      mainAxisSize: isLandscape ? MainAxisSize.min : MainAxisSize.max,
      children: children,
      
    );
  }
}
