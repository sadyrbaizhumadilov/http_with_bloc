import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_with_bloc/bloc/user_bloc.dart';
import 'package:http_with_bloc/services/user_provider.dart';
import 'package:http_with_bloc/widgets/action_button.dart';

import '../widgets/user_list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(userRepository: userRepository),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Http_with_Bloc'),
          ),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ActionButton(), Expanded(child: UserList())],
          ),
        ));
  }
}
