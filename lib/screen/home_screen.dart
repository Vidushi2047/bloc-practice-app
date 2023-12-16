import 'package:bloc_communication/cubit/value/cubit/value_cubit.dart';
import 'package:bloc_communication/cubit/word/cubit/word_cubit.dart';
import 'package:bloc_communication/screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/operation/cubit/operation_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            BlocListener<ValueCubit, ValueState>(
              listener: (context, state) {
                print("val - ${state.value1}");
                if (state.value1 != 0) {
                  val = state.value1;
                }
              },
              child: BlocBuilder<ValueCubit, ValueState>(
                builder: (context, state) {
                  return Text(state.value1.toString());
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  context.read<ValueCubit>().increment();
                },
                child: const Text("increase")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  context.read<ValueCubit>().decrement();
                },
                child: const Text("decrease")),
            // TextButton(
            //     onPressed: () {
            //       print(val);

            //     },
            //     child: const Text('get result')),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<OperationCubit>().result(val);
          context.read<WordCubit>().ShowWord(val);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ResultScren();
            },
          ));
        },
        child: const Icon(Icons.arrow_outward),
      ),
    );
  }
}
