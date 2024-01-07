import 'package:darkempath/screens/profiles/profiles_screen.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/typography/title_large.dart';
import 'package:smooth_corner/smooth_corner.dart';


class ConversationScreen extends StatefulWidget {
  const ConversationScreen({
    Key? key,
    required this.name,
    required this.picPath,
  }) : super(key: key);

  final String name;
  final String picPath;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<Map<String, dynamic>> chatData = [
    {'sender': 'npc', 'message': 'Hello!'}
  ];

  void _addReaction(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: emojis.length,
            itemBuilder: (BuildContext context, int emojiIndex) {
              return GestureDetector(
                onTap: () {
                  print('Selected Emoji: ${emojis[emojiIndex]}');
                  setState(() {
                    chatData[index]['reaction'] = emojis[emojiIndex];
                  });
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    emojis[emojiIndex],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  List<String> emojis = ['😀', '😎', '😊', '🎉', '🥳', '❤️', '🌟', '👍', '😂', '🥰']; // Sample emojis

  void _addChat(String message) {
    setState(() {
      chatData.add({'sender': 'player', 'message': message});
      if (message == 'Hello!') {
        chatData.add({'sender': 'npc', 'message': 'I hope you are having a great day!'});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double chatBoxHeight = MediaQuery.of(context).size.height * 0.5;

    return Scaffold(
      backgroundColor: const Color(0xFF221B27),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(name: widget.name)));
          },
          child: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  widget.name.split(' ')[0],
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            SizedBox(
              height: chatBoxHeight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: chatData.length,
                    itemBuilder: (BuildContext context, int index) {
                      var chat = chatData[index];
                      return GestureDetector(
                        onLongPress: () {
                          _addReaction(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: chat['sender'] == 'npc' ? MainAxisAlignment.start : MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.blueGrey, // Chat bubble color
                                    shape: SmoothRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(16),
                                        topRight: const Radius.circular(16),
                                        bottomLeft: chat['sender'] == 'npc'
                                            ? const Radius.circular(8)
                                            : const Radius.circular(16),
                                        bottomRight: chat['sender'] == 'npc'
                                            ? const Radius.circular(16)
                                            : const Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(chat['message']),
                                        if (chat['reaction'] != null)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(chat['reaction']),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFF492A60),
                    shape: SmoothRectangleBorder(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: TitleLarge(text: 'Your Reply', fontFamily: 'Heebo'),
                        ),
                        GestureDetector(
                          onTap: () {
                            _addChat('Hello!');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: SmoothRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('Hello!'),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String name;

  const ProfileScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text('Profile Page for $name'),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ConversationScreen(name: 'Sample Name', picPath: 'Sample Path'),
      ),
    ),
  );
}


