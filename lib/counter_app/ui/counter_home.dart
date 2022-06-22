import 'package:flutter/material.dart';

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
              Text(
                '$counter',
                style: const TextStyle(fontSize: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 35,
                      child: Icon(Icons.add, size: 50),
                    ),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 35,
                      child: Icon(Icons.remove, size: 50),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
