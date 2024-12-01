import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/helpers/extensions.dart';
import '/features/auth/login/ui/widgets/login_form_with_button.dart';
import '/features/auth/login/ui/widgets/login_header.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/have_account_question_text.dart';
import '../../../../core/widgets/or_divider.dart';
import '../../../../core/widgets/social_media_buttons.dart';
import '../logic/login_cubit/login_cubit.dart';
import '../logic/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},
              loading: (_) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
              success: (_) {
                context.pushNamedAndRemoveUntil(
                  Routes.appLayout,
                  predicate: (Route<dynamic> route) => false,
                );
              },
              error: (errorState) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      errorState.error.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(16),
                const LoginHeader(),
                verticalSpace(45),
                const LoginFormWithButton(),
                verticalSpace(24),
                const OrDivider(),
                verticalSpace(24),
                const SocialMediaButtons(),
                verticalSpace(24),
                HaveAccountQuestionText(
                  questionText: 'Don’t have an account? ',
                  clickableText: 'Sign Up',
                  onTap: () => context.pushNamed(Routes.signUpScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

