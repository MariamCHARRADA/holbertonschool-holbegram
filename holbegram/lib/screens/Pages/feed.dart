import 'package:flutter/material.dart';
import 'package:holbegram/models/post.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              "Holbegram",
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 32,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
            SizedBox(width: 10),
            Icon(Icons.send, color: Colors.black),
          ],
        ),
        elevation: 0,
      ),
      body: Posts(),
    );
  }
}
