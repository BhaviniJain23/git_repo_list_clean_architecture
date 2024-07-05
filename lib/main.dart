import 'package:ailoitte/app/config/router/app_router.dart';
import 'package:ailoitte/app/config/theme/app_theme.dart';
import 'package:ailoitte/app/core/injections.dart';
import 'package:ailoitte/app/core/constants/app_constants.dart';
import 'package:ailoitte/app/features/home/presentation/manager/git_repo_cubit.dart';
import 'package:ailoitte/app/features/home/presentation/pages/git_repo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GitRepoCubit>(create: (_) => getIt<GitRepoCubit>()),
      ],
      child: MaterialApp(
        title: 'Task',
        navigatorKey: navigatorKey,
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const GitRepoListScreen(),
      ),
    );
  }
}
