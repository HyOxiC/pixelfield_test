import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_test/shared/theme/app_theme.dart';
import '../features/collection/data/bottle_repository.dart';
import '../features/collection/logic/collection_bloc.dart';
import '../features/collection/logic/collection_event.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => CollectionBloc(BottleRepository())..add(LoadCollection()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: goRouter,
      ),
    );
  }
}
