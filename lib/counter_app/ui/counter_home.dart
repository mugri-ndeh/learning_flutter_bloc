import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/counter_app/cubit/counter_cubit.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              BlocBuilder<CounterCubit, CounterState>(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
