import 'package:ecommerce/controller/store_provider.dart';
import 'package:ecommerce/controller/user_provider.dart';
import 'package:ecommerce/view/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => StoreProvider(),),
        ChangeNotifierProvider(create:(context) => UserProvider(),)

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
        ThemeData(
              brightness: Brightness.dark,
              primaryColor: const Color(0xFFFFBD73),
              scaffoldBackgroundColor: const Color(0xFF202020)),
       home:const SplashScreen(),
      ),
    );
    
  }
}
