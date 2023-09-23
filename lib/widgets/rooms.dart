import 'package:fb_clone_flutter/config/models/user_model.dart';
import 'package:fb_clone_flutter/config/palette.dart';
import 'package:fb_clone_flutter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    super.key,
    required this.onlineUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListView.builder(
        itemCount: 1 + onlineUsers.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: _CreateRoomButton(),
            );
          }

          final User user = onlineUsers[index - 1];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
          side: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.videocam,
            color: Palette.facebookBlue,
          ),
          SizedBox(width: 8.0),
          Text(
            'Create\nRoom',
            style: TextStyle(color: Palette.facebookBlue),
          ),
        ],
      ),
    );
  }
}
