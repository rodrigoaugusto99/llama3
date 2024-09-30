import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'talking_with_bob_sponja_viewmodel.dart';

class TalkingWithBobSponjaView
    extends StackedView<TalkingWithBobSponjaViewModel> {
  const TalkingWithBobSponjaView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TalkingWithBobSponjaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  TalkingWithBobSponjaViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TalkingWithBobSponjaViewModel();
}
