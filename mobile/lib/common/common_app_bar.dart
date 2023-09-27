import 'package:flutter/material.dart';

class MeetRoomAppBar extends StatelessWidget with PreferredSizeWidget {
  const MeetRoomAppBar(
      {super.key,
      required this.title,
      required this.image,
      this.showBackButton = true});

  final String title;
  final AssetImage image;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: const Color(0xFF191919),
        image: DecorationImage(
          image: image, // AssetImage('assets/images/app_bar_cover.png'),
          fit: BoxFit.fitHeight,
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(80, 0, 0, 0),
            BlendMode.overlay,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(75, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  title, //'Select Meeting Room',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
