import 'package:bloc_communication/cubit/item/cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/countItem/cubit/count_item_cubit.dart';
import '../model/ItemModel.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  // List<Item> items = [];
  TextEditingController textController = TextEditingController();
  int length = 0;
  @override
  Widget build(BuildContext context) {
    // items = context.watch<ItemCubit>().state.itemList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Screen'),
        actions: [
          BlocListener<ItemCubit, ItemState>(
            listener: (context, state) {
              length = state.itemList
                  .where((Item item) => item.isCompleted == true)
                  .toList()
                  .length;
              context.read<CountItemCubit>().itemlength(length);
              print(length);
            },
            child: Container(
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 5,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: BlocBuilder<CountItemCubit, CountItemState>(
                        builder: (context, state) {
                          return Text(
                            state.countItems.toString(),
                            style: const TextStyle(color: Colors.black),
                          );
                        },
                      ),
                    ),
                  ),
                  const Center(child: Icon(Icons.add)),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
            return Column(
                children: List.generate(state.itemList.length, (index) {
              print('in builder-${state.itemList[index].isCompleted}');
              return ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Edit Todo'),
                          content: TextField(
                            controller: textController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ItemCubit>()
                                          .edit(index, textController.text);
                                      Navigator.pop(context);
                                      textController.clear();
                                    },
                                    icon: Icon(Icons.done))),
                            onChanged: (value) {
                              textController.text = value;
                            },
                            onSubmitted: (value) {
                              context.read<ItemCubit>().edit(index, value);
                              Navigator.pop(context);
                              textController.clear();
                            },
                          ),
                        );
                      },
                    );
                  },
                  leading: Checkbox(
                    value: state.itemList[index].isCompleted,
                    onChanged: (bool? checked) {
                      context.read<ItemCubit>().toggle(index);
                      print('isCompleted-${state.itemList[index].isCompleted}');
                    },
                  ),
                  title: Text(state.itemList[index].text!),
                  trailing: TextButton(
                      onPressed: () {
                        context
                            .read<ItemCubit>()
                            .delete(state.itemList[index].id);
                      },
                      child: const Text('remove')));
            }));
          },
        ),
      )),
    );
  }
}
