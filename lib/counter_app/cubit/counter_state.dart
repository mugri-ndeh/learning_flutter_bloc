part of 'counter_cubit.dart';

class CounterState {
  int value;
  bool valid;

  CounterState({
    required this.value,
    this.valid = false,
  });
}
