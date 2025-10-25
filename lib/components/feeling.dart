import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconLabelComponent extends StatelessWidget {
  final String svgAsset;
  final Color backgroundColor;
  final String label;

  IconLabelComponent({
    required this.svgAsset,
    required this.backgroundColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }
}

class Feeling extends StatelessWidget {
  const Feeling({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 33, // 👈 vertical gap (if it wraps)
      alignment: WrapAlignment.center,
      children: [
        IconLabelComponent(
          svgAsset: 'lib/assets/images/Happy.svg',
          backgroundColor: Color(0xFFEF5DA8),
          label: 'Happy',
        ),
        IconLabelComponent(
          svgAsset: 'lib/assets/images/Calm.svg',
          backgroundColor: Color(0xFFAEAFF7),
          label: 'Calm',
        ),
        IconLabelComponent(
          svgAsset: 'lib/assets/images/Relax.svg',
          backgroundColor: Color(0xFFF09E54),
          label: 'Relax',
        ),
        IconLabelComponent(
          svgAsset: 'lib/assets/images/Focus.svg',
          backgroundColor: Color(0xFFA0E3E2),
          label: 'Focus',
        ),
      ],
    );
  }
}
