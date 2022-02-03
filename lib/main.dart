import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plesson/data/repositories/assistants_repository.dart';
import 'package:plesson/ui/screens/saved_assistants_screen.dart';
import 'package:plesson/viewmodels/saved_assistants_viewmodel.dart';
import 'package:provider/provider.dart';

import 'ui/screens/search_page.dart';

void main() {
  runApp(const NavigationPage());
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedPage = 0;

  final _pages = const [
    SavedAssistantsScreen(),
    SearchAssistantsScreen(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedAssistantsViewModel(AssistantRepository())),
      ],
      child: MaterialApp(
        title: 'Plesson',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        home: Scaffold(
          body: _pages[selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.teal.shade700,

            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.74),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.bookmark, size: 30), label: 'Saved'),
              BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.message, size: 30), label: 'Messages'),
            ],
            currentIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
