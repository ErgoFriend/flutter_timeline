import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  final List<IconData> icons = [
    Icons.access_alarm,
    Icons.arrow_back_ios,
    Icons.account_balance_wallet,
    Icons.center_focus_weak,
    Icons.blur_on,
    Icons.dashboard,
    Icons.phone,
    Icons.tap_and_play,
    Icons.cloud_circle,
    Icons.code,
    Icons.comment,
    Icons.compare_arrows,
    Icons.content_copy,
    Icons.create,
    Icons.crop,
    Icons.dashboard,
    Icons.phone,
    Icons.tap_and_play,
    Icons.cloud_circle,
    Icons.code,
    Icons.comment,
    Icons.compare_arrows,
    Icons.content_copy,
    Icons.create,
    Icons.crop,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: icons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Icon(icons[index], size: 30),
            );
          },
        ),
      ),
    );
  }
}