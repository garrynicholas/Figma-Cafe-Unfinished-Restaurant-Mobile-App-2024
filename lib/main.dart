import 'package:figmacafe/beranda.dart';
import 'package:figmacafe/order_provider/model_catatan.dart';
import 'package:figmacafe/order_provider/model_reservasi.dart';
import 'package:figmacafe/presentation/order.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_provider.dart';
import 'package:figmacafe/presentation/reservasi.dart';
import 'package:figmacafe/presentation/reservasi/reservasi_provider.dart';
import 'package:figmacafe/splash_screen.dart';
import 'package:figmacafe/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReservationModel()),
        ChangeNotifierProvider(create: (_) => ModelCatatan()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<ReservasiProvider>(
            create: (_) => ReservasiProvider()),
        ChangeNotifierProvider(create: (context) => ReservationModel()),
        ChangeNotifierProvider(create: (_) => ModelCatatan()),
        //ChangeNotifierProvider<Beranda>(create: (_) => Beranda()),
        // Add other providers if needed
      ],
      child: MaterialApp(
        theme: ThemeData(
            // fontFamily: 'Poppinsx',
            ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/', // Set your initial route here
        routes: {
          '/': (context) => SplashScreen(),
          '/order': (context) =>
              OrderPage(), // Add this line for the "/order" route
          '/reservasi': (context) => Reservasi(),
          // Add other routes as needed
        },
      ),
    );
  }
}
