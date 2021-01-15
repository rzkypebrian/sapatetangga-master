import 'package:enerren/module/login/presenter.dart';
import 'package:enerren/util/ModeUtil.dart';

mixin CustomerPresenter on PresenterState {
  @override
  void submit() {
    ModeUtil.debugPrint("override submit here from customer");
  }
}

