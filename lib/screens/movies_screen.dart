import 'package:bloc_state_management_tutorial/cubits/movies_cubit/movies_cubit.dart';
import 'package:bloc_state_management_tutorial/cubits/task_cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MoviesLoadedSuccess) {
                    final movies = state.moviesList; //['a','b','c'];
                    return ListView.builder(
                      itemCount: movies!.length!,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.movie, color: Colors.blue),
                          title: Text(movies[index].title!),
                          subtitle: Text(movies[index].overview!),
                          trailing: Text(movies[index].releaseDate!),
                        );
                      },
                    );
                  }
                  if (state is MoviesLoadedFailure) {
                    return const Center(
                      child: Text('An Error Occurred'),
                    );
                  }
                  return Container();
                },
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                  title: const Text('Buy Ticket'),
                  trailing: BlocBuilder<TaskCubit, bool>(
                    builder: (context, state) {
                      return Checkbox(
                        value: state,
                        onChanged: (value) {
                          BlocProvider.of<TaskCubit>(context)
                              .toggleCheckbox(value!);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//data:api related work
//bloc: states defined and emitted
//Provide bloc in main file
//screen:manage states
