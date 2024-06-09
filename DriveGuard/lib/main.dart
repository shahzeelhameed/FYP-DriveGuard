import 'package:bro/Hive/cart_item_model.dart';
import 'package:bro/Hive/user_cart_model.dart';
import 'package:bro/screens/ContactUs.dart';
import 'package:bro/screens/EditProfile.dart';
import 'package:bro/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/signup.dart'; // Import the signup screen file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(UserCartAdapter());
  await Hive.openBox<UserCart>('userCartBox');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DriveGuard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Set the initial route to SignupScreen
        // initialRoute: '/signup',
        // routes: {
        //   // Define routes for the app
        //   '/signup': (context) => SignupScreen(),
        // },

        home: const SplashScreen());
  }
}
