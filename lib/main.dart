import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/config/theme.dart';
import 'package:e_commerce/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(WishlistStarted())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        title: 'E-Commerce',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
