import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/data/enums/dialog_type.dart';
import 'package:travel_planner/presentation/design/color_pallete.dart';

import '../../design/ui_helpers.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.icon: (context, sheetRequest, completer) =>
        _IconDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              request.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              request.description ?? '',
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => completer(DialogResponse()),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: request.showIconInMainButton ?? false
                    ? const Icon(Icons.check_circle)
                    : Text(request.mainButtonTitle ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IconDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _IconDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              request.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            UIHelper.horizontalSpaceSmall(),
            Icon(
              request.data?.iconData ?? Icons.clear,
              size: 24,
              color: ColorPalette.error,
            )
          ],
        ),
      ),
    );
  }
}

class IconDialogRequest {
  const IconDialogRequest({
    required this.iconData,
  });

  final IconData iconData;
}
