part of 'counter_cubit.dart';

class CounterState {
  int value;
  bool wasIncremented;

  CounterState({
    required this.value,
    this.wasIncremented = false,
  });
}
