import 'package:fit_buddy_app/backend/auth/auth_bloc.dart';
import 'package:fit_buddy_app/frontend/components/buttons.dart';
import 'package:fit_buddy_app/frontend/components/helpers.dart';
import 'package:fit_buddy_app/frontend/components/textfields.dart';
import 'package:fit_buddy_app/frontend/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Title1(text: 'welcome to fit-buddy !')),
          OutlinedTextField(labelText: 'E-mail', controller: emailController),
          OutlinedTextField(labelText: 'Password', controller: passwordController, obscureText: true),
          submitButton()
        ].padItems(const EdgeInsets.all(8.0)),
      ),
    );
  }

  BlocBuilder<AuthBloc, AuthState> submitButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const CircularProgressIndicator();
        }
        return PlainButton(onPressed: () => submit(context), text: 'sign in');
      },
    );
  }

  void submit(BuildContext context) {
    context.read<AuthBloc>().add(SignInEvent(email: emailController.text, password: passwordController.text));
  }
}
