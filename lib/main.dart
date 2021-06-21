import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Ticket_Bloc/ticket_boc.dart';
import 'Bloc/Ticket_Bloc/ticket_states.dart';
import 'Helpers/sharedText.dart';
import 'Screens/SplashPages/splashScreen.dart';
import 'Utils/ui_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  if (Platform.isAndroid) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TicketBloc>(
            create: (context) => TicketBloc(TicketStates())),
      ],
      child: MaterialApp(
        title: 'Ticket MX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: InfoComponents(builder: (context, deviceInfo) {
            SharedText.screenHeight = deviceInfo.screenHeight;
            SharedText.screenWidth = deviceInfo.screenWidth;
            SharedText.deviceType = deviceInfo.deviceType;

            return SplashScreen();
          }),
        ),
      ),
    );
  }
}
