import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/extensions/seed.dart';
import 'data/repositories/assistants_repository.dart';
import 'data/repositories/subjects_repository.dart';
import 'viewmodels/chat_viewmodel.dart';
import 'viewmodels/bookmarked_assistants_viewmodel.dart';
import 'viewmodels/search_assistants_viewmodel.dart';
import 'package:provider/provider.dart';
import 'data/repositories/chat_repository.dart';
import 'routes.dart' as routes;

void main() {
  runApp(const NavigationPage());
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  SubjectsRepository subjectsRepository = SubjectsRepository();
  AssistantRepository assistantRepository = AssistantRepository()..seed();
  ChatRepository chatRepository = ChatRepository()..seed();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => assistantRepository.user),
        ChangeNotifierProvider(create: (_) => BookmarkedAssistantsViewModel(assistantRepository)),
        ChangeNotifierProvider(create: (_) => SearchAssistantsViewModel(assistantRepository, subjectsRepository)),
        ChangeNotifierProvider(create: (_) => ChatViewModel(assistantRepository, chatRepository)),
      ],
      child: FutureBuilder<void>(
        future: assistantRepository.loadUserFromStorage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Text('Loading...', textDirection: TextDirection.ltr);
          } else {
            return MaterialApp(
              title: 'Plesson',
              theme: ThemeData(
                primarySwatch: Colors.teal,
                textTheme: GoogleFonts.robotoTextTheme(),
              ),
              onGenerateRoute: routes.generateRoute,
              initialRoute: routes.openingScreen,
            );
          }
        }
      )
    );
  }
}


