import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({Key? key}) : super(key: key);

  void increaseCounterBy(BuildContext context, [int value = 0]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        //* context.select() == BlocBuilder()
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCounter}');
        }),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().rest(),
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            debugPrint('Cambio');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy(context, 3),
            child: const Text('+3'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy(context, 2),
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseCounterBy(context, 1),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
