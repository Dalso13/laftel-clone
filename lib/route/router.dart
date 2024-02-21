import 'package:go_router/go_router.dart';
import 'package:laftel_clone/di/di_setup.dart';
import 'package:laftel_clone/presentation/ui/main_screen.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: const MainScreen(),
      ),
    ),
  ],
);
