import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconLabelComponent extends StatelessWidget {
  final String svgAsset;
  final Color backgroundColor;
  final String label;

  const IconLabelComponent({
    super.key,
    required this.svgAsset,
    required this.backgroundColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 69,
          height: 72,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: SvgPicture.asset(
              svgAsset,
              width: 39,
              height: 39,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontFamily: 'AlegreyaSans',
          ),
        ),
      ],
    );
  }
}

class Feeling extends StatelessWidget {
  const Feeling({super.key});

  @override
  Widget build(BuildContext context) {
    // screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 120, // height for icons + labels
      width: screenWidth, // main width
      child: Stack(
        clipBehavior: Clip.none, // 👈 allow overflow beyond screen
        children: [
          Positioned(
            left: 0,
            right: -40, // 👈 extend 40px beyond right side
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: const [
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Laugh.svg',
                    backgroundColor: Color(0xFFEF5DA8),
                    label: 'Happy',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Calm.svg',
                    backgroundColor: Color(0xFFAEAFF7),
                    label: 'Calm',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Relax.svg',
                    backgroundColor: Color(0xFFF09E54),
                    label: 'Relax',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Meditation.svg',
                    backgroundColor: Color(0xFFA0E3E2),
                    label: 'Focus',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Laugh.svg',
                    backgroundColor: Color(0xFFEF5DA8),
                    label: 'Happy',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Calm.svg',
                    backgroundColor: Color(0xFFAEAFF7),
                    label: 'Calm',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Relax.svg',
                    backgroundColor: Color(0xFFF09E54),
                    label: 'Relax',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Meditation.svg',
                    backgroundColor: Color(0xFFA0E3E2),
                    label: 'Focus',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Laugh.svg',
                    backgroundColor: Color(0xFFEF5DA8),
                    label: 'Happy',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Calm.svg',
                    backgroundColor: Color(0xFFAEAFF7),
                    label: 'Calm',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Relax.svg',
                    backgroundColor: Color(0xFFF09E54),
                    label: 'Relax',
                  ),
                  SizedBox(width: 33),
                  IconLabelComponent(
                    svgAsset: 'lib/assets/images/Meditation.svg',
                    backgroundColor: Color(0xFFA0E3E2),
                    label: 'Focus',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeelingScreen extends StatelessWidget {
  const FeelingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Feeling Example')),
      body: const Padding(padding: EdgeInsets.all(16.0), child: Feeling()),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(home: FeelingScreen(), debugShowCheckedModeBanner: false),
  );
}
