import 'package:flutter/material.dart';

import '../../constants/message/message_data.dart';
import 'chat_details.dart';
import 'message_item.dart';

class MessageChat extends StatelessWidget {
  const MessageChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding;
    if (screenWidth < 700) {
      leftPadding = 2.0;
    } else if (screenWidth < 1100) {
      leftPadding = 15.0;
    } else {
      leftPadding = 30.0;
    }
    return Padding(
      padding: EdgeInsets.only(top: 40, left: leftPadding),
      child: Row(
        children: [
          _buildMessageList(context),
          const ChatDetails(),
        ],
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double searchHeight;
    if (screenWidth < 700) {
      searchHeight = 30.0;
    } else if (screenWidth < 1100) {
      searchHeight = 50.0;
    } else {
      searchHeight = 68.0;
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 875,
        child: Column(
          children: [
            const SizedBox(height: 15),
            SizedBox(
              height: searchHeight,
              width: 485,
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: Color(0xffA1A1AA),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffD1D5DB)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffD1D5DB)),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color(0xffA1A1AA),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Visibility(
              visible: screenWidth < 1100,
              child: const SizedBox(
                height: 12,
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: ListView.separated(
                  itemCount: messageDetail.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return MessageItem(
                      img: messageDetail[index]['img'],
                      type: messageDetail[index]['type'],
                      name: messageDetail[index]['name'],
                      old: messageDetail[index]['old'],
                      time: messageDetail[index]['time'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
