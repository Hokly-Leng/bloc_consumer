import 'package:bloc_consumer/core/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.title});
  final String title;
  final CounterCubit cubit = CounterCubit(initialdata: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Consumer',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, int>(
            bloc: cubit,
            listenWhen: (previous, current) {
              if (current <= 5) {
                return true;
              } else {
                return false;
              }
            },
            listener: ((context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 500),
                  content: Text(
                    'Showing Snackbar $state',
                  ),
                ),
              );
            }),
            buildWhen: (previous, current) {
              if (current <= 5) {
                return true;
              } else {
                return false;
              }
            },
            builder: ((context, state) {
              return Center(
                child: Text(
                  '$state',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 50,
                  ),
                ),
              );
            }),  
          ),

          // BlocListener<CounterCubit, int>(
          //   bloc: cubit,
          //   listenWhen: (previous, current) {
          //     if (current >= 5) {
          //       return true;
          //     } else {
          //       return false;
          //     }
          //   },
          //   listener: ((context, state) {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         duration: const Duration(milliseconds: 500),
          //         content: Text('Showing snackabar $state'),
          //       ),
          //     );
          //   }),
          //   child: BlocBuilder<CounterCubit, int>(
          //     bloc: cubit,
          //     buildWhen: (previous, current) {
          //       if (current >= 5) {
          //         return true;
          //       } else {
          //         return false;
          //       }
          //     },
          //     builder: ((context, state) {
          //       return Text(
          //         '$state',
          //         style: const TextStyle(color: Colors.amber, fontSize: 50),
          //       );
          //     }),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => cubit.decrement(),
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.remove,
                  size: 45,
                  color: Colors.amber,
                ),
              ),
              IconButton(
                onPressed: () => cubit.increment(),
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.amber,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
