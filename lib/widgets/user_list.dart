import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_with_bloc/bloc/user_bloc.dart';
import 'package:http_with_bloc/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(listener: (((context, state) {
      if (state is LoadedUserState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User is loaded')));
      }
    })), builder: (context, state) {
      if (state is EmptyUserState) {
        return const Center(
            child: Text(
          'No data recieved .Please push button Load',
          style: TextStyle(fontSize: 20),
        ));
      }
      if (state is LoadingUserState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoadedUserState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID:${state.loadedUser[index].id}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    '${state.loadedUser[index].name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Email:${state.loadedUser[index].email}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'phone:${state.loadedUser[index].phone}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      if (state is ErrorUserState) {
        return const Center(
            child: Text(
          ' Error fetching users',
          style: TextStyle(color: Colors.red),
        ));
      }
      return const SizedBox.shrink();
    });
  }
}