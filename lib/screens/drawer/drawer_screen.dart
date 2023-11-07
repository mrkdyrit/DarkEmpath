import 'package:darkempath/screens/inbox/inbox_screen.dart';
import 'package:darkempath/screens/progress/progress_screen.dart';
import 'package:darkempath/widgets/typography/large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String screenTitle = 'Home';
  Widget shownScreen = const InboxScreen();

  void updateScreenTitle(String screenTitle) {
    setState(() {
      this.screenTitle = screenTitle;
    });
  }

  void changeScreen(Widget screen) {
    setState(() {
      shownScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221B27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          screenTitle,
          style: const TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                height: 30,
                width: 30,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD9D9D9)
                  ),
                ),
              ),
            )
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF1D1820),
        child: ListView(
          children: [
            ListTile(
              title: const LargeText(
                text: 'Chats',
              ),
              leading: const Icon(Icons.chat_bubble, color: Colors.white,),
              onTap: () {
                Navigator.of(context).pop();
                updateScreenTitle('Inbox');
                changeScreen(const InboxScreen());
              },
            ),
            ListTile(
              title: const LargeText(
                text: 'Progress',
              ),
              leading: const Icon(Icons.show_chart, color: Colors.white,),
              onTap: () {
                Navigator.of(context).pop();
                updateScreenTitle('Progress');
                changeScreen(const ProgressScreen());
              },
            ),
            const ListTile(
              title: LargeText(
                text: 'Settings',
              ),
              leading: Icon(Icons.settings, color: Colors.white,),
            ),
            ListTile(
              title: const LargeText(
                text: 'Quit',
              ),
              leading: const Icon(Icons.logout, color: Colors.white,),
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      ),
      body: shownScreen,
    );
  }
}