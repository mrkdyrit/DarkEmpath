import 'package:darkempath/screens/conversation/conversation.dart';
import 'package:flutter/material.dart';
import 'package:darkempath/data/chat/inbox_data.dart';


void main() {
  runApp(darkEmpath_inbox());
}

class darkEmpath_inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ContainerRowList(inboxData: InboxData()),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContainerRow extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;
  final String time;

  ContainerRow({required this.text1, required this.text2, required this.image, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          text1,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            text2,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              width: 50.0,
              height: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class ContainerRowList extends StatelessWidget {
  final InboxData inboxData;

  ContainerRowList({required this.inboxData});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final message = inboxData.inbox[index];
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context, 
                  //   MaterialPageRoute(builder: (context) => const ConversationScreen(),)
                  // );
                },
                child: ContainerRow(
                  text1: message['name'],
                  text2: message['last_message'],
                  image: message['image'],
                  time: message['time'],
                ),
              );
            },
            childCount: inboxData.inbox.length,
          ),
        ),
      ],
    );
  }
}

