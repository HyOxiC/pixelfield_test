import 'package:go_router/go_router.dart';
import 'package:pixelfield_test/features/collection/ui/bottle_detail_screen.dart';
import '../features/collection/ui/collection_screen.dart';
import '../features/auth/ui/splash_screen.dart';
import '../features/auth/ui/welcome_screen.dart';
import '../features/auth/ui/sign_in_screen.dart';
import '../features/collection/model/bottle.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/welcome', builder: (_, __) => const WelcomeScreen()),
    GoRoute(path: '/signin', builder: (_, __) => const SignInScreen()),
    GoRoute(
      path: '/collection',
      builder: (_, __) => const CollectionScreen(),
      routes: [
        GoRoute(
          path: '/detail',
          builder: (context, state) {
            // You must pass a `Bottle` object to this screen.
            final bottle = state.extra as Bottle;

            return BottleDetailScreen(bottle: bottle);
          },
        ),
      ],
    ),
  ],
);
