import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone_flutter/config/models/story_model.dart';
import 'package:fb_clone_flutter/config/models/user_model.dart';
import 'package:fb_clone_flutter/config/palette.dart';
import 'package:fb_clone_flutter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    super.key,
    required this.currentUser,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        itemCount: 1 + stories.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: _StoryCard(
                isAddStory: false,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: _StoryCard(
              isAddStory: false,
              currentUser: currentUser,
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story? story;

  const _StoryCard({
    this.isAddStory = false,
    required this.currentUser,
    this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: story?.imageUrl ?? currentUser.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: isAddStory
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      iconSize: 30.0,
                      color: Palette.facebookBlue,
                      onPressed: () {},
                    )
                  : ProfileAvatar(
                      hasBorder: story?.isViewed ?? false,
                      imageUrl: story?.user.imageUrl ?? 'https://w7.pngwing.com/pngs/972/334/png-transparent-computer-icons-add-logo-desktop-wallpaper-add-thumbnail.png'),
            )),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add Story' : story?.user.name ?? currentUser.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
