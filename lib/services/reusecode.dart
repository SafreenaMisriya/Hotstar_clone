import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  final String imageurl;
  final String name;
  const Profile({
    super.key,
    required this.imageurl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipOval(
              child: Image.network(
                imageurl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
