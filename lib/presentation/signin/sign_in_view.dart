import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_planner/presentation/common/buttons/primary_button.dart';
import 'package:travel_planner/presentation/signin/sign_in_viewmodel.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: PrimaryTextButton(
            onPressed: () async {
              await viewModel.onSignPressed();
            },
            title: "Sign in",
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}
