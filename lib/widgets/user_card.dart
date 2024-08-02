// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:users_api/models/user.dart';
import 'package:users_api/screens/user_details.dart';

class UserCard extends StatelessWidget {
  final User user;
  final String imagePath;
  const UserCard({
    super.key,
    required this.user,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1.5,
            color:  Color.fromARGB(255, 133, 189, 223),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imagePath),
              ),
            ),
            Column(
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 5, 9),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 23, 94, 153),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetails(
                        user: user,
                        imagePath: imagePath,
                      ),
                    ),
                  );
                },
                icon:
                    Icon(Icons.arrow_forward_ios_rounded, color: Color.fromARGB(255, 170, 193, 210)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
