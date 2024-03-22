import 'package:go_router/go_router.dart';
import 'package:laftel_clone/di/di_setup.dart';
import 'package:laftel_clone/presentation/ui/main_screen.dart';
import 'package:laftel_clone/presentation/view_model/detail_anime_view_model.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';
import 'package:laftel_clone/presentation/view_model/search_view_model.dart';
import 'package:laftel_clone/presentation/view_model/storage_box_view_model.dart';
import 'package:provider/provider.dart';

import '../presentation/ui/detail_anime/detail_anime_screen.dart';
import '../presentation/ui/main_screen_item/notice/notice_screen.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => getIt<MainViewModel>()),
          ChangeNotifierProvider(create: (_) => getIt<StorageBoxViewModel>()),
          ChangeNotifierProvider(create: (_) => getIt<SearchViewModel>()),
        ],
        child: const MainScreen(),
      ),
    ),
    GoRoute(
      path: '/notice',
      builder: (context, state) => const NoticeScreen()
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
