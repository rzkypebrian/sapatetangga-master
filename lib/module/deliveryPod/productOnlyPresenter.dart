import 'package:flutter/material.dart';
import 'productOnlyView.dart';
import 'ViewModel.dart';

class ProductOnlyPresenter extends StatefulWidget {
  final String title;
  final ValueChanged<ViewModel> onSubmit;
  final ViewModel viewModel;
  final int imageQuality;

  ProductOnlyPresenter({
    Key key,
    this.title,
    this.onSubmit,
    this.viewModel,
    this.imageQuality,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductOnlyView();
  }
}

abstract class ProductOnlyPresenterState extends State<ProductOnlyPresenter> {
  ViewModel model = new ViewModel();

  @override
  void initState() {
    if (widget.viewModel != null) {
      model.copyFrom(widget.viewModel);
    }
    super.initState();
  }

  bool validateProductImage() {
    if (model.imagePickerControllers.validate()) {
      model.isValidImagePicker = true;
      model.commit();
      return null;
    } else {
      model.isValidImagePicker = false;
      model.commit();
      return false;
    }
  }

  bool validate() {
    bool isValid = true;
    isValid = validateProductImage() ?? isValid;
    return isValid;
  }

  void submit() {
    if (!validate()) return;
    if (widget.onSubmit != null) {
      widget.onSubmit(model);
    }
  }
}
