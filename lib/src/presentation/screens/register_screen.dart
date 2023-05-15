import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/src/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/src/presentation/presentation.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;
    return Form(
        // key: _formKey,
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          onChanged: registerCubit.usernameChange,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Correo electronico',
          onChanged: registerCubit.emailChange,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Contraseña ${password.value.length}',
          obscureText: true,
          onChanged: registerCubit.passwordChange,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {
            // final isValid = _formKey.currentState!.validate();
            // if (!isValid) return;
            registerCubit.onSubmit();
          },
          label: const Text('Crear usuario'),
          icon: const Icon(Icons.save),
        ),
      ],
    ));
  }
}
