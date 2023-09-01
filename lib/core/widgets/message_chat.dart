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
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30),
      child: Row(
        children: [
          _buildMessageList(),
          const ChatDetails(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 515,
      height: 875,
      child: Column(
        children: [
          const SizedBox(height: 15),
          const SizedBox(
            height: 68,
            width: 485,
            child: TextField(
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
    );
  }
}
