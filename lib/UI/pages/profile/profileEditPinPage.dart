import 'package:flutter/material.dart';
import 'package:flutter_bank/UI/widgets/buttons.dart';
import 'package:flutter_bank/UI/widgets/formsPassword.dart';
import 'package:flutter_bank/bloc/auth/authBloc.dart';
import 'package:flutter_bank/bloc/auth/authEvent.dart';
import 'package:flutter_bank/bloc/auth/authState.dart';
import 'package:flutter_bank/shared/sharedMethods.dart';
import 'package:flutter_bank/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinCtrl = TextEditingController(text: '');
  final newPinCtrl = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit PIN',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 30),

              //
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),

                //
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE_USERNAME_INPUT
                    CustomFormFieldPassword(
                      title: 'Old PIN',
                      controller: oldPinCtrl,
                    ),

                    const SizedBox(height: 16),

                    //NOTE_FULL_NAME_INPUT
                    CustomFormFieldPassword(
                      title: 'New PIN',
                      controller: newPinCtrl,
                    ),

                    const SizedBox(height: 30),

                    //
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthPinUpdate(
                                oldPinCtrl.text,
                                newPinCtrl.text,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
