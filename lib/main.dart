import 'package:e_commerce/blocs/blocs.dart';
import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/config/theme.dart';
import 'package:e_commerce/repositories/category/category_repository.dart';
import 'package:e_commerce/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce/repositories/product/product_repository.dart';
import 'package:e_commerce/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:e_commerce/screens/screens.dart';
import 'package:e_commerce/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProduct()),
        )
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
