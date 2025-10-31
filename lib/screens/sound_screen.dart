import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remix_ic/remix_ic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'main_screen.dart';
import '../components/music_player_controls.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({super.key});

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    final isTablet = screenWidth > 600;

    double bottomNavigationHeight = 85;

    const double baseWidth = 375;
    const double baseHeight = 812;

    // Enhanced responsive scaling for all screen sizes
    double scaleFactor = screenWidth < 360
        ? 0.7
        : isTablet
        ? (screenWidth / baseWidth).clamp(1.2, 2.0)
        : (screenWidth / baseWidth).clamp(0.8, 1.3);

    double heightScaleFactor = screenHeight < 600
        ? 0.6
        : isTablet
        ? (screenHeight / baseHeight).clamp(1.0, 1.8)
        : (screenHeight / baseHeight).clamp(0.7, 1.2);

    double textScale = screenWidth < 360
        ? 0.7
        : isLandscape
        ? (isTablet ? (screenWidth / 1024).clamp(0.8, 1.2) : 0.75)
        : (isTablet ? (screenWidth / 768).clamp(1.0, 1.5) : 1.0);

    double iconScale = screenWidth < 360
        ? 0.8
        : isTablet
        ? (screenWidth / 768).clamp(1.0, 1.4)
        : (screenWidth / baseWidth).clamp(0.8, 1.1);

    double imageScale = screenWidth < 360
        ? 0.6
        : isLandscape
        ? (isTablet ? (screenHeight / 600).clamp(0.8, 1.2) : 0.6)
        : (isTablet ? (screenWidth / 768).clamp(1.2, 2.0) : 1.0);

    if (isLandscape) {
      bottomNavigationHeight = screenHeight < 500 ? 60 : (isTablet ? 80 : 65);
    } else {
      bottomNavigationHeight = screenHeight < 600 ? 70 : (isTablet ? 90 : 80);
    }

    Widget content = _buildSoundContent(
      scaleFactor,
      heightScaleFactor,
      textScale,
      screenWidth,
      isLandscape,
      iconScale,
      imageScale,
      isTablet,
    );

    return Scaffold(
      body: SafeArea(
        child: isLandscape
            ? Column(
                children: [
                  _buildHeader(
                    scaleFactor,
                    heightScaleFactor,
                    isLandscape,
                    isTablet,
                    iconScale,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: _buildSoundContent(
                        scaleFactor,
                        heightScaleFactor,
                        textScale,
                        screenWidth,
                        isLandscape,
                        iconScale,
                        imageScale,
                        isTablet,
                        includeHeader: false,
                      ),
                    ),
                  ),
                ],
              )
            : content,
      ),
    );
  }

  Widget _buildSoundContent(
    double scaleFactor,
    double heightScaleFactor,
    double textScale,
    double screenWidth,
    bool isLandscape,
    double iconScale,
    double imageScale,
    bool isTablet, {
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
                  'lib/assets/images/Down.svg',
                  width: 22 * iconScale,
                  height: 18 * iconScale,
                  placeholderBuilder: (BuildContext context) =>
                      Icon(Icons.menu),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/images/Playlist.svg',
                  width: 24 * iconScale,
                  height: 24 * iconScale,
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
                  Text(
                    'Calming  Playlist',
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontSize: (isTablet ? 28 : 24) * textScale,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: (isTablet ? 40 : 10) * heightScaleFactor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'lib/assets/images/RainGirl.svg',
                          width: (250 * imageScale).clamp(120, 290),
                          height: (250 * imageScale).clamp(120, 290),
                        ),
                      ),
                      SizedBox(height: (isTablet ? 12 : 8) * heightScaleFactor),
                      Column(
                        children: [
                          Center(
                            child: Text(
                              'Rain On Glass',
                              style: TextStyle(
                                fontFamily: 'Alegreya',
                                fontSize: (isTablet ? 32 : 28) * textScale,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'By: Painting with Passion',
                              style: TextStyle(
                                fontFamily: 'AlegreyaSans',
                                fontSize: (isTablet ? 16 : 14) * textScale,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF371B34),
                              ),
                            ),
                          ),
                          SizedBox(height: 40 * heightScaleFactor),
                          MusicPlayerControls(),
                          SizedBox(height: 20 * heightScaleFactor),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          : isTablet
          ? Center(
              child: Container(
                width: (screenWidth * 0.8).clamp(400, 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Calming  Playlist',
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontSize: (32 * textScale).clamp(24, 48),
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: (25 * heightScaleFactor).clamp(15, 40)),
                    SvgPicture.asset(
                      'lib/assets/images/RainGirl.svg',
                      width: (180 * imageScale).clamp(120, 280),
                      height: (180 * imageScale).clamp(120, 280),
                    ),
                    SizedBox(height: (20 * heightScaleFactor).clamp(12, 30)),
                    Text(
                      'Rain On Glass',
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontSize: (38 * textScale).clamp(28, 56),
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'By: Painting with Passion',
                      style: TextStyle(
                        fontFamily: 'AlegreyaSans',
                        fontSize: (18 * textScale).clamp(14, 24),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF371B34),
                      ),
                    ),
                    SizedBox(height: (40 * heightScaleFactor).clamp(25, 60)),
                    MusicPlayerControls(),
                    SizedBox(height: (30 * heightScaleFactor).clamp(20, 50)),
                  ],
                ),
              ),
            )
          : Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: (20 * scaleFactor).clamp(15, 40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: (10 * heightScaleFactor).clamp(5, 20)),
                      Text(
                        'Calming  Playlist',
                        style: TextStyle(
                          fontFamily: 'Alegreya',
                          fontSize: (28 * textScale).clamp(20, 40),
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: (200 * heightScaleFactor).clamp(10, 35)),
                      Center(
                        child: SvgPicture.asset(
                          'lib/assets/images/RainGirl.svg',
                          width: (screenWidth * 0.9 * imageScale).clamp(
                            130,
                            290,
                          ),
                          height: (screenWidth * 0.9 * imageScale).clamp(
                            130,
                            290,
                          ),
                        ),
                      ),
                      SizedBox(height: (200 * heightScaleFactor).clamp(8, 25)),
                      Center(
                        child: Text(
                          'Rain On Glass',
                          style: TextStyle(
                            fontFamily: 'Alegreya',
                            fontSize: (35 * textScale).clamp(24, 48),
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'By: Painting with Passion',
                          style: TextStyle(
                            fontFamily: 'AlegreyaSans',
                            fontSize: (16 * textScale).clamp(12, 22),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF371B34),
                          ),
                        ),
                      ),
                      SizedBox(height: (150 * heightScaleFactor).clamp(20, 50)),
                      MusicPlayerControls(),
                      SizedBox(height: (30 * heightScaleFactor).clamp(20, 50)),
                    ],
                  ),
                ),
              ),
            ),
    );

    return Column(
      mainAxisSize: isLandscape ? MainAxisSize.min : MainAxisSize.max,
      children: children,
    );
  }

  Widget _buildHeader(
    double scaleFactor,
    double heightScaleFactor,
    bool isLandscape,
    bool isTablet,
    double iconScale,
  ) {
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
              'lib/assets/images/Down.svg',
              width: (20 * iconScale).clamp(16, 32),
              height: (20 * iconScale).clamp(16, 32),
              placeholderBuilder: (BuildContext context) => Icon(Icons.menu),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'lib/assets/images/Playlist.svg',
              width: (20 * iconScale).clamp(16, 32),
              height: (20 * iconScale).clamp(16, 32),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
