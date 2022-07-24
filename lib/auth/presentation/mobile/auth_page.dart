import 'package:fit_buddy_app/frontend/components/buttons.dart';
import 'package:fit_buddy_app/frontend/components/helpers.dart';
import 'package:fit_buddy_app/frontend/components/textfields.dart';
import 'package:fit_buddy_app/frontend/components/texts.dart';
import 'package:fit_buddy_app/frontend/mobile/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presenter/auth_presenter.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthPresenter>().state;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Title1(text: state.pageTitle)),
          Image(
            image: AssetImage(state.appLogo),
            width: 200,
          ),
          OutlinedTextField(labelText: state.emailLabel, controller: emailController),
          OutlinedTextField(
            labelText: state.passwordLabel,
            controller: passwordController,
            obscureText: state.isPasswordObfuscated,
          ),
          submitButton()
        ].padItems(const EdgeInsets.all(8.0)),
      ),
    );
  }

  BlocConsumer<AuthPresenter, AuthState> submitButton() {
    return BlocConsumer<AuthPresenter, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const CircularProgressIndicator();
        }
        return PlainButton(onPressed: () => submit(context), text: state.submitActionLabel);
      },
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
    );
  }

  void submit(BuildContext context) {
    context.read<AuthPresenter>().add(SignInEvent(email: emailController.text, password: passwordController.text));
  }
}
