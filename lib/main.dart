import 'package:biblio/core/common/widgets/bottom_navigation.dart';
import 'package:biblio/core/theming/app_theme.dart';
import 'package:biblio/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injection_container.dart' as injectionContainer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectionContainer.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injectionContainer.sl<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const BottomNavigation(),
      ),
    );
  }
}
