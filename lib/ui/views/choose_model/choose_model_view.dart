import 'package:flutter/material.dart';
import 'package:ollama/utils/helpers.dart';
import 'package:stacked/stacked.dart';

import 'choose_model_viewmodel.dart';

class ChooseModelView extends StackedView<ChooseModelViewModel> {
  const ChooseModelView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChooseModelViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: styledText(text: 'Escolha seu modelo'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: viewModel.listOfModels == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                styledText(text: "Seus models:"),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: viewModel.listOfModels!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final model = viewModel.listOfModels![index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[100]),
                            onPressed: () => viewModel.navToModel(model),
                            child: Text(model.name),
                          ),
                          IconButton(
                            onPressed: () => viewModel.deleteModel(model),
                            color: Colors.red,
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => heightSeparator(10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.createModel(),
                  child: const Text('Ou crie um novo model'),
                ),
              ],
            ),
    );
  }

  @override
  ChooseModelViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChooseModelViewModel();
}
