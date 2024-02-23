import 'package:bloc_state_management_tutorial/cubits/movies_cubit/movies_cubit.dart';
import 'package:bloc_state_management_tutorial/screens/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/task_cubit/task_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoviesCubit(),
          ),
          BlocProvider(
            create: (context) => TaskCubit(),
          ),
        ],
        child: const MoviesScreen(),
      ),
    );
  }
}
