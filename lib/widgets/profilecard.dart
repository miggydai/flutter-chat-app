import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileCard extends StatelessWidget {
  final String image;
  final String name;
  final bool isActive;

  const ProfileCard({
    Key? key,
    required this.image,
    required this.name,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 40,
            backgroundColor: Colors.grey[800],
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
