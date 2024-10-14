import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/constants/routings.dart';
import 'package:todoapp/features/home/presentation/home_screen.dart';

const taskBoxName = 'tasks';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFF3F5F8),
    ),
  );
  runApp(
    const MyApp(),
  );
}

const Color primaryColor = Colors.cyan;
const Color primaryContainerColor = Colors.teal;
const secondaryTextColor = Color(0xFFAFBED0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xFF1D2830);

    return GetMaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            headlineSmall: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: secondaryTextColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          iconColor: secondaryTextColor,
          prefixIconColor: secondaryTextColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.black,
            ),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          primaryContainer: primaryContainerColor,
          surface: Color.fromARGB(255, 243, 245, 248),
          onSurface: primaryTextColor,
          secondary: primaryColor,
          onSecondary: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            headlineSmall: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: secondaryTextColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          iconColor: secondaryTextColor,
          prefixIconColor: secondaryTextColor,
          border: InputBorder.none,
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          primaryContainer: primaryContainerColor,
          surface: Color.fromARGB(255, 34, 34, 34),
          onSurface: Colors.white,
          secondary: primaryColor,
          onSecondary: Colors.white,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      getPages: Routings().pages,
      // initialRoute: '/',
      home: HomeScreen(),
    );
  }
}
