import 'package:flutter/material.dart';

class LeftChat extends StatelessWidget {
  const LeftChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.network(
                'https://images.unsplash.com/photo-1510520434124-5bc7e642b61d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Container(
                    color: const Color(0xff0566BD),
                    height: 50,
                    width: 190,
                    child: const Center(
                      child: Text('How old are they?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '10:00 Am',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff71717A)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
