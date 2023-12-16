import 'package:bloc_communication/cubit/countItem/cubit/count_item_cubit.dart';
import 'package:bloc_communication/cubit/dublicate/cubit/dublicate_cubit.dart';
import 'package:bloc_communication/cubit/item/cubit/item_cubit.dart';
import 'package:bloc_communication/cubit/operation/cubit/operation_cubit.dart';
import 'package:bloc_communication/cubit/value/cubit/value_cubit.dart';
import 'package:bloc_communication/cubit/word/cubit/word_cubit.dart';
import 'package:bloc_communication/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ValueCubit(),
        ),
        BlocProvider(
          create: (context) => OperationCubit(),
        ),
        BlocProvider(
          create: (context) => WordCubit(),
        ),
        BlocProvider(
          create: (context) => ItemCubit(),
        ),
        BlocProvider(
          create: (context) => CountItemCubit(),
        ),
        BlocProvider<DublicateCubit>(
          create: (context) => DublicateCubit(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
