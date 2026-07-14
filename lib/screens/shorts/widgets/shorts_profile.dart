import 'package:flutter/material.dart';

class ShortsProfile extends StatelessWidget {
  const ShortsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Image.network(
          'https://static.wikia.nocookie.net/supernaturalpowers/images/f/f2/%EC%B4%88%EB%A1%9D%EC%83%89_%EA%B7%B8%EB%A6%BC.png/revision/latest/scale-to-width-down/1000?cb=20210113075932&path-prefix=ko',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
