import 'package:bloc_state_management_tutorial/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/login_cubit/login_cubit.dart';
import 'cubits/movies_cubit/movies_cubit.dart';
import 'cubits/task_cubit/task_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
          create: (context) => MoviesCubit(),
        ),
        BlocProvider(
          create: (context) => TaskCubit(),
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
