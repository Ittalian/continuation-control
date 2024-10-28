import 'package:continuation_control/config/router/routes.dart';
import 'package:continuation_control/services/continuation_service.dart';
import 'package:continuation_control/services/doing_service.dart';
import 'package:continuation_control/view_models/continuation_view_model.dart';
import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'config/firestore/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContinuationViewModel(
            ContinuationService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DoingViewModel(
            DoingService(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
