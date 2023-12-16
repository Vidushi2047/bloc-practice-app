import 'package:bloc_communication/cubit/dublicate/cubit/dublicate_cubit.dart';
import 'package:bloc_communication/cubit/item/cubit/item_cubit.dart';
import 'package:bloc_communication/cubit/operation/cubit/operation_cubit.dart';
import 'package:bloc_communication/cubit/word/cubit/word_cubit.dart';
import 'package:bloc_communication/screen/Item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScren extends StatefulWidget {
  const ResultScren({super.key});

  @override
  State<ResultScren> createState() => _ResultScrenState();
}

class _ResultScrenState extends State<ResultScren> {
  TextEditingController textController = TextEditingController();
  TextEditingController textController1 = TextEditingController(text: '');
  int length = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: const [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.pink,
            child: Text('0'),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'enter the text'),
                onSubmitted: (value) {
                  if (value != '' || value.trim().isNotEmpty) {
                    context.read<ItemCubit>().add(value);
                  }
                  textController.clear();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<OperationCubit, OperationState>(
                  bloc: OperationCubit(),
                  builder: (context, state) {
                    print('operation');
                    print(state.operation);
                    return Text('Your Value is ${state.operation}');
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<WordCubit, WordState>(
                  builder: (context, state) {
                    print('word');
                    return Text(state.word);
                  },
                ),
              ],
            ),
            // BlocConsumer<DublicateCubit, DublicateState>(
            //   listener: (context, state) {
            //     print("1");
            //   },
            //   builder: (context, state) {
            //     final dublicateCubit =
            //         context.read<DublicateCubit>(); // Access the cubit
            //     print('2');
            //     return SizedBox(
            //       height: 400,
            //       width: 300,
            //       child: ListView.builder(
            //         itemCount: state.item.length,
            //         itemBuilder: (context, index) {
            //           return Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               ListTile(
            //                 onTap: () {
            //                   showDialog(
            //                     context: context,
            //                     builder: (context) {
            //                       return AlertDialog(
            //                         title: Text('Edit Todo'),
            //                         content: TextField(
            //                           controller: textController1,
            //                           decoration: InputDecoration(
            //                               suffixIcon: IconButton(
            //                                   onPressed: () {
            //                                     dublicateCubit.edit(index,
            //                                         textController1.text);
            //                                     Navigator.pop(context);
            //                                     textController1.clear();
            //                                   },
            //                                   icon: Icon(Icons.done))),
            //                           onChanged: (value) {
            //                             textController1.text = value;
            //                           },
            //                           onSubmitted: (value) {
            //                             dublicateCubit.edit(index, value);
            //                             Navigator.pop(context);
            //                             textController1.clear();
            //                           },
            //                         ),
            //                       );
            //                     },
            //                   );
            //                 },
            //                 leading: Checkbox(
            //                   value: state.item[index].isCompleted,
            //                   onChanged: (value) {
            //                     dublicateCubit.toggle(index);
            //                     print(
            //                         "onchange--${state.item[index].isCompleted}");
            //                   },
            //                 ),
            //                 title: Text(state.item[index].text),
            //               ),
            //               Visibility(
            //                   visible: state.item[index].isCompleted,
            //                   child: const Icon(Icons.check))
            //             ],
            //           );
            //         },
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ItemScreen();
            },
          ));
        },
        child: const Text('Get Item'),
      ),
    );
  }
}
