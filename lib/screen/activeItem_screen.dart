import 'package:bloc_communication/cubit/item/cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveItem extends StatefulWidget {
  const ActiveItem({super.key});

  @override
  State<ActiveItem> createState() => _ActiveItemState();
}

class _ActiveItemState extends State<ActiveItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text('activeItem-${context.read<ItemCubit>().countActiveItem()}'),
      ),
    );
  }
}
