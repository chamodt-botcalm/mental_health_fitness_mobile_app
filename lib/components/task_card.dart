import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color backgroundColor;
  final Color buttonColor;
  final Widget icon;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.backgroundColor,
    required this.buttonColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,

      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_circle_filled,
                      color: buttonColor,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          icon,
        ],
      ),
    );
  }
}

class TaskCards extends StatelessWidget {
  const TaskCards({super.key});

  final List<Map<String, dynamic>> tasks = const [
    {
      'title': 'Peer Group Meetup',
      'description':
          'Let\'s open up to the thing that matters amoung the people',
      'buttonText': 'Join Now',
      'backgroundColor': Color(0xFFFCDDEC),
      'buttonColor': Color(0xFFE91E63),
      'svgAsset': 'lib/assets/images/Meetup.svg',
    },
    {
      'title': 'Meditation',
      'description':
          'Aura is the most important thing that matters to you join us on',
      'buttonText': '06:00 PM',
      'backgroundColor': Color(0xFFfbe2cc),
      'buttonColor': Color(0xFFFF9800),
      'svgAsset': 'lib/assets/images/Meditation.svg',
    },
    {
      'title': 'Meditation',
      'description':
          'Aura is the most important thing that matters to you join us on',
      'buttonText': '06:00 PM',
      'backgroundColor': Color(0xFFfbe2cc),
      'buttonColor': Color(0xFFFF9800),
      'svgAsset': 'lib/assets/images/Meditation.svg',
    },
    {
      'title': 'Yoga Session',
      'description':
          'Join us for a relaxing yoga session to improve flexibility',
      'buttonText': '07:30 AM',
      'backgroundColor': Color(0xFFE8F5E8),
      'buttonColor': Color(0xFF4CAF50),
      'svgAsset': 'lib/assets/images/Meditation.svg',
    },
    {
      'title': 'Breathing Exercise',
      'description': 'Practice deep breathing techniques for stress relief',
      'buttonText': 'Start Now',
      'backgroundColor': Color(0xFFE3F2FD),
      'buttonColor': Color(0xFF2196F3),
      'svgAsset': 'lib/assets/images/Meetup.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...tasks
              .map(
                (task) => TaskCard(
                  title: task['title'],
                  description: task['description'],
                  buttonText: task['buttonText'],
                  backgroundColor: task['backgroundColor'],
                  buttonColor: task['buttonColor'],
                  icon: SvgPicture.asset(
                    task['svgAsset'],
                    width: 60,
                    height: 60,
                  ),
                ),
              )
              .toList(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
