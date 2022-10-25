import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_planner/presentation/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final String? id;
  const HomeView({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => viewModel.incrementCounter(),
          ),
          body: Center(
              child: Text(
            viewModel.counter.toString(),
            style: const TextStyle(fontSize: 30),
          ))),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.setCounterTo999(),
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
    );
  }
}
