import 'package:go_router/go_router.dart';
import 'package:laftel_clone/di/di_setup.dart';
import 'package:laftel_clone/presentation/ui/main_screen.dart';
import 'package:laftel_clone/presentation/view_model/detail_anime_view_model.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import '../presentation/ui/detail_anime/detail_anime_screen.dart';

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
    GoRoute(
      path: '/detail-anime',
      builder: (context, state) {
        final int id = state.extra as int;
        return ChangeNotifierProvider(
          create: (_) => getIt<DetailAnimeViewModel>(),
          child: DetailAnimeScreen(
            id: id,
          ),
        );
      },
    ),
  ],
);
