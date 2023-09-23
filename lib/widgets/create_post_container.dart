import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone_flutter/config/models/models.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: CachedNetworkImageProvider(
                  currentUser.imageUrl,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?'),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 1,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.orange,
                  ),
                  onPressed: () => print('Live'),
                  label: const Text(
                    'Live',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.green,
                  ),
                  onPressed: () => print('Photo'),
                  label: const Text(
                    'Photo',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  onPressed: () => print('Room'),
                  label: const Text(
                    'Room',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
