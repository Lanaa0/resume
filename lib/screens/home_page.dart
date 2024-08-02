// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_api/models/user.dart';
import 'package:users_api/provider/user_provider.dart';

import '../widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 216, 219),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 105, 144),
        title: Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: 
      Padding(
  
        padding: const EdgeInsets.all(20),
        child: userProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : userProvider.errorMessage != null
                ? Center(child: Text(userProvider.errorMessage!))
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      User user = userProvider.users[index];
                      int n = Random().nextInt(4) + 1;
                      return UserCard(
                        imagePath: 'assets/images/${n}.png',
                        user: user,
                      );
                    }),
      ),
    );
  }
}
