import 'package:flutter/material.dart';

import 'left_chat.dart';
import 'right_chat.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  void showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset position =
        button.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
      items: <PopupMenuEntry>[
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        ),
        const PopupMenuItem(
          value: 'block',
          child: Text(
            'Block',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ).then((value) {
      if (value == 'delete') {
        // Handle delete action
      } else if (value == 'block') {
        // Handle block action
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imgHeight;
    double imgWidth;
    double textSize;
    double leftPadding;
    double rightPadding;
    double topPadding;
    double iconSize;
    if (screenWidth < 700) {
      imgHeight = 20.0;
      imgWidth = 20.0;
      textSize = 14.0;
      leftPadding = 4.0;
      rightPadding = 15.0;
      topPadding = 4.0;
      iconSize = 10.0;
    } else if (screenWidth < 1100) {
      imgHeight = 40.0;
      imgWidth = 40.0;
      textSize = 16.0;
      leftPadding = 6.0;
      rightPadding = 25.0;
      topPadding = 7.0;
      iconSize = 17.0;
    } else {
      imgHeight = 40.0;
      imgWidth = 40.0;
      textSize = 18.0;
      leftPadding = 7.0;
      rightPadding = 30.0;
      topPadding = 8.0;
      iconSize = 20.0;
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: Container(
          height: 875,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        height: imgHeight,
                        width: imgWidth,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1510520434124-5bc7e642b61d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: leftPadding, top: topPadding),
                      child: Text(
                        'Rebecca Nicholas',
                        style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff111827)),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: GestureDetector(
                        onTap: () {
                          showPopupMenu(context);
                        },
                        child: const Icon(Icons.more_vert),
                      ),
                    ),
                    Visibility(
                        visible: screenWidth > 1100,
                        child: const SizedBox(width: 15)),
                  ],
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF706F6F)),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                Visibility(visible: screenWidth > 1100, child: const Spacer()),
                const LeftChat(),
                const RightChat(),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff0566BD),
                            border: Border.all(color: const Color(0xff0566BD)),
                          ),
                          child: Icon(
                            Icons.send,
                            size: iconSize,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD1D5DB))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD1D5DB))),
                      hintText: 'Type a message',
                      hintStyle: const TextStyle(
                        color: Color(0xff71717A),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
