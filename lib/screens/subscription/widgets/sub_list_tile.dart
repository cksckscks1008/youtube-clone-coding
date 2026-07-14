import 'package:flutter/material.dart';

class SubListTile extends StatelessWidget {
  final String profile;
  final String id;
  final String underId;

  const SubListTile({
    super.key,
    required this.profile,
    required this.id,
    required this.underId
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(profile),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(id, style: TextStyle(color: Colors.white, fontSize: 16), ),
          Text(underId, style: TextStyle(color: Colors.grey, fontSize: 12),)
        ],
      ),
      trailing: Ink(
        width: 60,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
                size: 24,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
