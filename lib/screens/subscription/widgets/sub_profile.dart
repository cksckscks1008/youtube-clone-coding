import 'package:flutter/material.dart';

class SubProfile extends StatelessWidget {
  final String profile;
  final String userName;

  const SubProfile({
    super.key,
    required this.profile,
    required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(profile)
        ),
        const SizedBox(height: 10,),
        Text(userName, style: TextStyle(color: Colors.white, ),maxLines: 1, overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
