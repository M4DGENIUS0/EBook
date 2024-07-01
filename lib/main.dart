import 'package:ebookstore/Screen/Home_Screen.dart';
import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/provider/state%20management/addtosave.dart';
import 'package:ebookstore/provider/state%20management/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(412, 915),
      builder: (context, child) => 
       MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SearchProvider(),),
          ChangeNotifierProvider(create: (context) => AddToSaveProvider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                fontFamily: "Poppins",
                color: assets.blue_Color,
              ),
            ),
            scaffoldBackgroundColor: const Color.fromARGB(246, 255, 255, 255),
            appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(246, 255, 255, 255)),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
