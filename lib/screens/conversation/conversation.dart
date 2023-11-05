import 'package:darkempath/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  List<Map<String, dynamic>> chatData = [
    {
      'sender': 'npc',
      'message': 'Hello!'
    }
  ];

  @override
  Widget build(BuildContext context) {

    double chatBoxHeight = MediaQuery.of(context).size.height * 0.5;
    double choiceBoxHeight = MediaQuery.of(context).size.height - chatBoxHeight;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: DarkEmpathColors.buttonColor,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'John Doe', 
          style: TextStyle(
            color: DarkEmpathColors.buttonColor
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: chatBoxHeight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    for(var chat in chatData) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: chat['sender'] == 'npc' ? MainAxisAlignment.start : MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Container(
                                decoration: ShapeDecoration(
                                  color: DarkEmpathColors.bgColor,
                                  shape: SmoothRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(16), 
                                      topRight: const Radius.circular(16), 
                                      bottomLeft: chat['sender'] == 'npc' ? const Radius.circular(8) : const Radius.circular(16), 
                                      bottomRight: chat['sender'] == 'npc' ? const Radius.circular(16) : const Radius.circular(8)
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(chat['message']),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ],
                ),
              ),
            )
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: ShapeDecoration(
                  color: DarkEmpathColors.bgColor,
                  shape: SmoothRectangleBorder(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Your Reply',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: ShapeDecoration(
                                color: DarkEmpathColors.darGreyColor,
                                shape: SmoothRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(''),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}