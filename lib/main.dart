import 'package:btc_prices/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: BlocBuilder<UsersCubit, UsersCubitState>(
            builder: (context, state) {
              if (state is UsersCubitInitial) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<UsersCubit>().getUsers();
                    },
                    child: const Text("Get Users"),
                  ),
                );
              } else if (state is UsersCubitLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UsersCubitSuccess) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.users[index]["name"]),
                      subtitle: Text(state.users[index]["email"]),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Failed to fetch users"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
