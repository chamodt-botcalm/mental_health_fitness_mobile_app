import 'package:flutter/material.dart';

class MusicPlayerControls extends StatefulWidget {
  const MusicPlayerControls({super.key});

  @override
  State<MusicPlayerControls> createState() => _MusicPlayerControlsState();
}

class _MusicPlayerControlsState extends State<MusicPlayerControls> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(Icons.shuffle, 24),
        SizedBox(width: 20),
        _buildControlButton(Icons.skip_previous, 28),
        SizedBox(width: 20),
        _buildPlayPauseButton(),
        SizedBox(width: 20),
        _buildControlButton(Icons.skip_next, 28),
        SizedBox(width: 20),
        _buildControlButton(Icons.repeat, 24),
      ],
    );
  }

  Widget _buildControlButton(IconData icon, double size) {
    return Container(
      width: 40,
      height: 30,
     
      child: Icon(
        icon,
        size: size,
        color: Color(0xFFEF5DA8),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFEF5DA8),
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}