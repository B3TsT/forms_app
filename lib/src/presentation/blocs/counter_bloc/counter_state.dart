part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState({this.counter = 10, this.transactionCount = 0});
  final int counter;
  final int transactionCount;

  CounterState copyWith({int? counter, int? transactionCount});

  @override
  List<Object> get props => [counter, transactionCount];
}

class CounterInitial extends CounterState {
  const CounterInitial({int counter = 10, int transactionCount = 0})
      : super(counter: counter, transactionCount: transactionCount);

  @override
  CounterInitial copyWith({int? counter, int? transactionCount}) =>
      CounterInitial(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );
}
