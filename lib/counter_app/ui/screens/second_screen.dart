import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/counter_app/constants/enums.dart';
import 'package:learning_flutter_bloc/counter_app/logic/cubit/counter_cubit.dart';
import 'package:learning_flutter_bloc/counter_app/logic/cubit/internet_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Wifi connected')));
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('mobile connected')));
        } else if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('No internet')));
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
            ),
            height: 200,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.wasIncremented) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Counter incremented'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                    if (!state.wasIncremented) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Counter decremented'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.value < 0) {
                      return Text(
                        '${state.value}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                        ),
                      );
                    }

                    if (state.value >= 0) {
                      return Text(
                        '${state.value}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                        ),
                      );
                    } else {
                      return Text(
                        '${state.value}',
                        style: const TextStyle(fontSize: 40),
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      child: const CircleAvatar(
                        radius: 35,
                        child: Icon(Icons.remove, size: 50),
                      ),
                    ),
                    const SizedBox(width: 40),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      child: const CircleAvatar(
                        radius: 35,
                        child: Icon(Icons.add, size: 50),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                    child: Text('Go to first screen'),
                    color: widget.color,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen(
                                    title: 'Second Screen',
                                    color: Colors.red,
                                  )));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
