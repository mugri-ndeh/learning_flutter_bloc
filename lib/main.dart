import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/counter_app/logic/cubit/counter_cubit.dart';
import 'package:learning_flutter_bloc/counter_app/logic/cubit/internet_cubit.dart';
import 'package:learning_flutter_bloc/counter_app/ui/screens/counter_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterHome(title: 'Home', color: Colors.blue),
      ),
    );
  }
}
