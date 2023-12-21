import 'package:color_theme/home_page.dart';
import 'package:color_theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(ThemeData.light(useMaterial3: true), ThemeData.dark(useMaterial3: true), null),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.getTheme(),
          darkTheme: themeProvider.getDarkTheme(),
          themeMode: themeProvider.getThemeMode(),
          home: const HomePage(),
        );
      },
    );
    // 只有Android 12才支持从壁纸创建主题颜色，iOS不支持
    // return DynamicColorBuilder(builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
    //   return MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: lightDynamic,
    //       useMaterial3: true,
    //     ),
    //     darkTheme: ThemeData(
    //       colorScheme: darkDynamic,
    //       useMaterial3: true,
    //     ),
    //     home: const HomePage(),
    //   );
    // },);
  }
}
