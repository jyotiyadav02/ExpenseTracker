import 'package:expenseapp/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 37, 182, 244),
);
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {});

  // to block the landscape mode....
  runApp(
    MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.surfaceVariant,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.surfaceTint,
            ),
          ),
          scaffoldBackgroundColor: kDarkColorScheme.onPrimaryContainer,
          // textTheme: ThemeData().textTheme.copyWith(
          //       titleLarge: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         // color:Color.fromARGB(255, 255, 93, 64),
          //         color:kDarkColorScheme.onSecondary,
          //       ),
          //     ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme()
              .copyWith(foregroundColor: kColorScheme.onPrimaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: const Color.fromARGB(255, 211, 243, 204),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.secondary,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 245, 210, 240),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color:Color.fromARGB(255, 255, 93, 64),
                  color:
                      const Color.fromARGB(255, 241, 11, 57).withOpacity(0.7),
                ),
              ),
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: const Expenses()),
  );
}
