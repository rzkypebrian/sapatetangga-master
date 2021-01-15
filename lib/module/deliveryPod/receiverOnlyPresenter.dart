import 'package:enerren/component/InputComponent.dart';
import 'package:flutter/material.dart';
import 'receiverOnlyView.dart';
import 'ViewModel.dart';

class ReceiverOnlyPresenter extends StatefulWidget {
  final String title;
  final ValueChanged<ViewModel> onSubmit;
  final int imageQuality;
  final String senderLabel;
  final String senderNameLabel;

  const ReceiverOnlyPresenter({
    Key key,
    this.title,
    this.onSubmit,
    this.imageQuality,
    this.senderLabel,
    this.senderNameLabel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ReceiverOnlyView();
  }
}

abstract class ReceiverOnlyPresenterState extends State<ReceiverOnlyPresenter> {
  ViewModel model = new ViewModel();

  bool validateReceiverImage() {
    if (model.receiverImagePickerControllers.validate()) {
      return null;
    } else {
      return false;
    }
  }

  bool validateReceiverName() {
    if (model.receiverController.text.isEmpty) {
      model.receiverController.setStateInput = StateInput.Error;
      model.commit();
      return false;
    } else {
      model.receiverController.setStateInput = StateInput.Enable;
      model.commit();
      return null;
    }
  }

  bool validate() {
    bool isValid = true;
    isValid = validateReceiverImage() ?? isValid;
    isValid = validateReceiverName() ?? isValid;
    return isValid;
  }

  void submit() {
    if (!validate()) return;
    if (widget.onSubmit != null) {
      widget.onSubmit(model);
    }
  }
}
