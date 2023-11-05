import 'package:darkempath/data/chat/inbox_data.dart';
import 'package:darkempath/screens/conversation/conversation.dart';
import 'package:darkempath/widgets/typography/large_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<Map<String, dynamic>> inboxData = InboxData().inbox;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 240,
                  height: 30,
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        smoothness: 0.6
                      ),
                      color: const Color(0x32DAD3CD)
                    ),
                    child: Row(
                      children: [
                        Wrap(
                          children: [
                            GestureDetector(
                              child: SizedBox(
                                width: 120,
                                height: 30,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: SmoothRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      smoothness: 0.6
                                    ),
                                    color: const Color(0xFFDAD3CD)
                                  ),
                                  child: const Center(
                                    child: Text('Chats')
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: SizedBox(
                                width: 120,
                                height: 30,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: SmoothRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      smoothness: 0.6
                                    ),
                                    // color: const Color(0xFFDAD3CD)
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Groups',
                                      style: TextStyle(
                                        color: Color(0xFFDAD3CD)
                                      ),
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (var chat in inboxData) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ConversationScreen(),)
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFD9D9D9),
                              ),
                              // child: ClipOval(
                              //   child: Image.asset(chat['image']),
                              // ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LargeText(text: chat['name']),
                            SizedBox(
                              width: 200,
                              child: LargeText(text: chat['last_message']),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LargeText(text: chat['time']),
                        const LargeText(text: ''),
                      ],
                    ),
                  ],
                ),
              )
            )
          ]
        ],
      ),
    );
  }
}